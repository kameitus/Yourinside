class Interview < ApplicationRecord

  validates :answer_1, presence: true
  validates :answer_2, presence: true
  validates :answer_3, presence: true
  validates :answer_4, presence: true
  validates :answer_5, presence: true
  validates :answer_6, presence: true
  validates :answer_7, presence: true
  validates :answer_8, presence: true
  validates :answer_9, presence: true
  validates :title, presence: true,length: { maximum: 50 }
  
  belongs_to :user,optional: true
  mount_uploader :photo, PhotoUploader
  mount_uploader :gakki, GakkiUploader
  mount_uploader :item, ItemUploader
  
  has_many :reverses_of_great, class_name: "Greats", foreign_key: "user_id"
  has_many :be_praise, through: :reverses_of_great, source: :user
end
