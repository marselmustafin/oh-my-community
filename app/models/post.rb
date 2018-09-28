class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :community
  has_many :comments, dependent: :destroy

  validates :title, :text, presence: true
end
