module Ratings
  class Create
    include Interactor

    delegate :params, :post, :user, to: :context

    def call
      context.fail!(error: rating.errors) if rating.invalid?
      context.rating = rating
    end

    private

    def rating
      @rating ||= Rating.create(prepared_params)
    end

    def prepared_params
      params.merge(post: post, user: user)
    end
  end
end
