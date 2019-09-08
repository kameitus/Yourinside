class User < ApplicationRecord
before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255},
   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  validates :age, presence: true, length: { maximum: 255}
  validates :gender, presence: true, length: { maximum: 255}
  validates :area, presence: true, length: { maximum: 255}
  validates :part, presence: true, length: { maximum: 255}
  validates :category, presence: true, length: { maximum: 255}
  validates :sns_1, presence: true, length: { maximum: 255}
  validates :sns_2, presence: true, length: { maximum: 255}
  validates :icon, presence: true, length: { maximum: 255}
end
