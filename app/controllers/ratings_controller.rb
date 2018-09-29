class RatingsController < ApplicationController
  expose :post

  def create
    respond_with approve_rating.rating
  end

  private

  def approve_rating
    @approve_rating ||= Ratings::Approve.call(post: post, user: current_user, params: rating_params)
  end

  def rating_params
    params.require(:rating).permit(:value)
  end
end
