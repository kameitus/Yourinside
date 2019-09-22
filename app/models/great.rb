class Great < ApplicationRecord
  belongs_to :user
  belongs_to :great, class_name: "User"
end
