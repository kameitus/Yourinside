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
  validates :category, length: { maximum: 255}, on: :update
  validates :sns_1,  length: { maximum: 255}, on: :update
  validates :sns_2,  length: { maximum: 255}, on: :update
  
  has_secure_password
  
  mount_uploader :icon, IconUploader
end
