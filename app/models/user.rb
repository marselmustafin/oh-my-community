class User < ApplicationRecord
  include PgSearch

  devise :database_authenticatable, :registerable, :confirmable, :recoverable,
    :rememberable, :trackable, :lockable, :invitable, request_keys: [:subdomain]

  belongs_to :community
  has_many :posts, foreign_key: "author_id", inverse_of: :author, dependent: :destroy
  has_many :comments, foreign_key: "commenter_id", inverse_of: :commenter, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_one_attached :avatar

  accepts_nested_attributes_for :community

  enum role: { member: "member", owner: "owner" }

  validates :email, presence: true, format: { with: Devise.email_regexp }, uniqueness: { scope: :community_id }
  validates :password, presence: true, if: :password_required?
  validates :password, confirmation: true, if: :password_required?
  validates :password, length: { within: Devise.password_length }, allow_blank: true
  validates :full_name, presence: true, length: { minimum: 5, maximum: 256 }

  delegate :subdomain, to: :community, prefix: true

  pg_search_scope :search_by_full_name_and_email,
    against: %i[full_name email],
    using: {
      tsearch: { prefix: true },
      trigram: { threshold: 0.3 }
    }

  def self.find_for_authentication(warden_conditions)
    find_by(
      email: warden_conditions[:email],
      community: Community.find_by(subdomain: warden_conditions[:subdomain])
    )
  end

  private

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
