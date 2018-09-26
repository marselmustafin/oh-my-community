class Community < ApplicationRecord
  has_many :members, class_name: "User", dependent: :destroy
end
