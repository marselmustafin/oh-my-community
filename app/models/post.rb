class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :community

  validates :title, :text, presence: true
end
