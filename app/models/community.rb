class Community < ApplicationRecord
  has_many :members, class_name: "User", dependent: :destroy

  def owner
    members.find_by(role: "owner")
  end
end
