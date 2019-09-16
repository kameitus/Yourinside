class Interview < ApplicationRecord
  belongs_to :user
  
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
end
