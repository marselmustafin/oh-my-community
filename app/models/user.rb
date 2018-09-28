class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :community
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :community

  enum role: { member: "member", owner: "owner" }

  validates :full_name, presence: true
end
