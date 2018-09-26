class Community < ApplicationRecord
  has_many :members, class_name: "User", inverse_of: :community, dependent: :destroy

  validates :name, :subdomain, presence: true

  def owner
    members.owner.first
  end
end
