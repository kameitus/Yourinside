class User < ApplicationRecord
before_save { self.email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  
  validates :email, presence: true, length: { maximum: 255},
   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
  validates :age, length: { maximum: 255}, on: :update
  validates :gender, length: { maximum: 255}, on: :update
  validates :area, length: { maximum: 255}, on: :update
  validates :part, length: { maximum: 255}, on: :update
  validates :category, length: { maximum: 255},on: :update
  validates :twitter,  length: { maximum: 255}, on: :update
  validates :facebook,  length: { maximum: 255}, on: :update
  validates :instagram,  length: { maximum: 255}, on: :update
  validates :comment,  length: { maximum: 50}, on: :update
  
  
  has_secure_password
  
  mount_uploader :icon, IconUploader
  
  belongs_to :prefecture, optional: true
  
  has_one :interview, dependent: :destroy
  
  has_many :greats, dependent: :destroy
  has_many :praises, through: :greats, source: :great
  has_many :reverses_of_great, class_name: "Great", foreign_key: "great_id"
  has_many :be_praises, through: :reverses_of_great, source: :user
  
  def praise(other_user)
    unless self == other_user
     self.greats.find_or_create_by(great_id: other_user.id )
    end
  end
    
  def unpraise(other_user)
    great = self.greats.find_by(great_id: other_user.id)
    great.destroy if great
  end
  
  def praise?(other_user)
    self.praises.include?(other_user)
  end
  
end
