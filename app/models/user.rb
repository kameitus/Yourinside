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
  
  has_one :interview
end
