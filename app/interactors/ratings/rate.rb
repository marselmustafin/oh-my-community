module Ratings
  class Rate
    include Interactor::Organizer

    organize Create,
      UpdateAverageRatings
  end
end
