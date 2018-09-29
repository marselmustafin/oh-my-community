module Ratings
  class Approve
    include Interactor::Organizer

    organize Create,
      UpdateAverageRatings
  end
end
