class RatingsController < ApplicationController
  respond_to :json
  expose :post

  def create
    respond_with approve_rating.rating, location: post_url(post)
  end

  private

  def approve_rating
    @approve_rating ||= Ratings::Rate.call(post: post, user: current_user, params: rating_params)
  end

  def rating_params
    params.require(:rating).permit(:value)
  end
end
