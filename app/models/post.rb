class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :community
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :title, :text, presence: true
  validates :title, length: { maximum: 100 }
end
