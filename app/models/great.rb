class Great < ApplicationRecord
  belongs_to :user
  belongs_to :interview, class_name: "User"
end
