class User < ApplicationRecord
before_save { self.email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  
  validates :email, presence: true, length: { maximum: 255},
   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
  validates :age, presence: true, length: { maximum: 255}, on: :update
  validates :gender, presence: true, length: { maximum: 255}, on: :update
  validates :area, presence: true, length: { maximum: 255}, on: :update
  validates :part, presence: true, length: { maximum: 255}, on: :update
  validates :category, presence: true, length: { maximum: 255}, on: :update
  validates :sns_1,  length: { maximum: 255}, on: :update
  validates :sns_2,  length: { maximum: 255}, on: :update
  validates :icon, length: { maximum: 1000}, on: :update
  
  has_secure_password
  
  mount_uploader :icon, IconUploader
end
