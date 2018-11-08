module Ratings
  class UpdateAverageRatings
    include Interactor

    delegate :rating, to: :context
    delegate :post, to: :rating
    delegate :author, to: :post, prefix: true

    def call
      post.update!(average_rating: post_avg_rating)
      post_author.update!(rating: author_avg_rating)
    end

    private

    def post_avg_rating
      @post_avg_rating ||= post.ratings.average(:value).to_f
    end

    def author_avg_rating
      @author_avg_rating ||= post_author.posts.average(:average_rating).to_f
    end
  end
end
