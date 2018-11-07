class User < ApplicationRecord
  include PgSearch

  devise :database_authenticatable, :registerable, :confirmable, :recoverable,
    :rememberable, :trackable, :lockable, :invitable, :omniauthable,
    omniauth_providers: [:google_oauth2], request_keys: [:subdomain]

  belongs_to :community
  has_many :posts, foreign_key: "author_id", inverse_of: :author, dependent: :destroy
  has_many :comments, foreign_key: "commenter_id", inverse_of: :commenter, dependent: :destroy
  has_many :ratings, dependent: :nullify
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
      tsearch: {
        prefix: true,
        any_word: true
      },
      trigram: { threshold: 0.1 }
    }

  def self.find_for_authentication(warden_conditions)
    find_by(
      email: warden_conditions[:email],
      community: Community.find_by(subdomain: warden_conditions[:subdomain])
    )
  end

  def self.from_omniauth(auth, community_id)
    find_or_create_by!(provider: auth.provider, uid: auth.uid, community_id: community_id) do |user|
      user.full_name = auth.info.name
      user.email = auth.info.email
      user.avatar.attach(io: URI.parse(auth.info.image).open, filename: "photo.jpg")
      user.skip_confirmation!
    end
  end

  private

  def password_required?
    (provider.blank? || uid.blank?) && (!persisted? || !password.nil? || !password_confirmation.nil?)
  end
end
