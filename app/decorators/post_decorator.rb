class PostDecorator < ApplicationDecorator
  delegate :id, :author, :title, :text, :ratings, :comments

  def user_rating_value(user_id)
    rating = object.ratings.find_by(user_id: user_id)
    rating.present? ? rating.value : 0
  end

  def author_name
    object.author.full_name
  end

  def created_at
    object.created_at.strftime("%a %m/%d/%y")
  end
end
