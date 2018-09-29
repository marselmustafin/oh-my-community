require "rails_helper"

describe Ratings::UpdateAverageRatings do
  subject(:update_average_ratings) { described_class.call(post: post, rating: rating) }

  let(:author) { create :user, rating: 3.0 }

  let(:post) { create :post, author: author, average_rating: 0.0 }
  let(:rating) { create :rating, value: 2.0, post: post }

  before do
    create :post, author: author, average_rating: 3.0
  end

  describe ".call" do
    it "updates average rating of post and its author" do
      expect { update_average_ratings }
        .to change(post, :average_rating).from(0.0).to(2.0)
                                         .and change(author, :rating).from(3.0).to(2.5)

      is_expected.to be_success
    end
  end
end
