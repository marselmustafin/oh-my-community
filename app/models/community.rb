class Community < ApplicationRecord
  has_many :users, inverse_of: :community, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 50 }
  validates :subdomain, presence: true, uniqueness: { case_sensitive: false },
                        length: { maximum: 20 }, subdomain: true
  validates :description, length: { maximum: 300 }

  def owner
    users.owner.first
  end
end
