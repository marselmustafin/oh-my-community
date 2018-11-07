class Post < ApplicationRecord
  include PgSearch

  belongs_to :author, class_name: "User", counter_cache: true
  belongs_to :community
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :title, :text, presence: true
  validates :title, length: { minimum: 5, maximum: 100 }
  validates :text, length: { minimum: 300 }

  pg_search_scope :search_by_title_and_author_name,
    against: %i[title],
    associated_against: {
      author: :full_name
    },
    using: {
      tsearch: {
        prefix: true,
        any_word: true
      },
      trigram: { threshold: 0.1 }
    }
end
