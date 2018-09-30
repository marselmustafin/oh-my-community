class Community < ApplicationRecord
  has_many :users, inverse_of: :community, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, :subdomain, presence: true

  def owner
    users.owner.first
  end
end
