class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :community
  has_many :ratings, dependent: :destroy

  validates :title, :text, presence: true
end
