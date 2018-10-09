require "rails_helper"

describe Ratings::Create do
  subject(:create_rating) { described_class.call(params: params) }

  let(:post) { create :post }
  let(:user) { create :user }

  let(:params) do
    {
      value: 3,
      user: user,
      post: post
    }
  end

  describe ".call" do
    it "creates new rating from user for post with specified value" do
      expect { create_rating }.to change(Rating, :count).from(0).to(1)

      expect(create_rating.rating).to have_attributes(value: 3, user: user, post: post)
      is_expected.to be_success
    end
  end
end
