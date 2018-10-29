module Communities
  class RatingsController < ApplicationController
    respond_to :json

    expose :post

    def create
      respond_with approve_rating.rating, location: post_url(post)
    end

    private

    def approve_rating
      @approve_rating ||= Ratings::Rate.call(params: rating_params)
    end

    def rating_params
      params.require(:rating)
            .permit(:value)
            .merge(user: current_user, post: post)
    end
  end
end
