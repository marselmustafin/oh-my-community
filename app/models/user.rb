class User < ApplicationRecord
  include PgSearch

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :community
  has_many :posts, foreign_key: "author_id", inverse_of: :author, dependent: :destroy, counter_cache: true
  has_many :comments, foreign_key: "commenter_id", inverse_of: :commenter, dependent: :destroy
  has_many :ratings, dependent: :destroy

  accepts_nested_attributes_for :community

  enum role: { member: "member", owner: "owner" }

  validates :full_name, presence: true

  pg_search_scope :search_by_full_name_and_email,
    against: %i[full_name email],
    using: {
      tsearch: { prefix: true },
      trigram: { threshold: 0.3 }
    }
end
