class PostDecorator < ApplicationDecorator
  delegate :id, :author, :title, :text, :ratings, :comments, :average_rating

  TRUNCATION_SIZE = 200

  def user_rating_value(user_id)
    rating = object.ratings.find_by(user_id: user_id)
    rating.present? ? rating.value : 0
  end

  def author_name
    object.author.full_name
  end

  def reading_time
    object.text.reading_time(format: :approx)
  end

  def truncated_text
    object.text.truncate(TRUNCATION_SIZE)
  end

  def created_at
    object.created_at.strftime("%m-%d-%y")
  end
end
