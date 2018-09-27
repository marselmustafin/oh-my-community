class RatingsController < ApplicationController
  expose :rating

  def create
    rating.save

    respond_with rating
  end

  private

  def rating_params
    params.require(:rating).permit(:value)
  end
end
