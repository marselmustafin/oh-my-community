class RatingsController < ApplicationController
  expose :post
  expose :rating, parent: :post

  def create
    rating.user = current_user
    rating.save

    redirect_to post
  end

  private

  def rating_params
    params.require(:rating).permit(:value)
  end
end
