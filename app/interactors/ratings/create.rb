module Ratings
  class Create
    include Interactor

    delegate :params, to: :context

    def call
      context.fail!(error: rating.errors) if rating.invalid?
      context.rating = rating
    end

    private

    def rating
      @rating ||= Rating.create!(params)
    end
  end
end
