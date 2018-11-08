module Ratings
  class Rate
    include Interactor::Organizer

    around do |interactor|
      ActiveRecord::Base.transaction do
        interactor.call
      end
    end

    organize Create,
      UpdateAverageRatings
  end
end
