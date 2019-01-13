require "rails_helper"

describe Ratings::RatePost do
  subject(:rate_post) { described_class.call(params: params) }

  let(:params) do
    {
      value: 2,
      user: user,
      post: post
    }
  end

  let(:user) { create :user }

  let(:author) { create :user, rating: 3.0 }
  let(:post) { create :post, author: author, average_rating: 0.0 }

  before do
    create :post, author: author, average_rating: 3.0
  end

  describe ".call" do
    it "creates rating and updates average rating of post and its author" do
      expect { rate_post }
        .to change(Rating, :count).from(0).to(1)
                                  .and change(post, :average_rating).from(0.0).to(2.0)
                                                                    .and change(author, :rating).from(3.0).to(2.5)

      is_expected.to be_success
    end
  end
end
