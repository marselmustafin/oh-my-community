require "rails_helper"

describe Users::SortedQuery do
  subject(:query) { described_class.new(sort_params) }

  let(:sort_params) { {} }

  let!(:first_user) { create :user, full_name: "Richard III", rating: 5.0, posts_count: 3 }
  let!(:second_user) { create :user, full_name: "John Travolta", rating: 3.5, posts_count: 2 }
  let!(:third_user) { create :user, full_name: "Carl Richmond", rating: 0.0, posts_count: 3 }

  describe "#all" do
    subject(:result) { query.all }

    context "when sort param is rating" do
      let(:sort_params) do
        {
          sort_param: "rating"
        }
      end

      it "returns users sorted by rating" do
        expect(result).to eq([first_user, second_user, third_user])
      end
    end

    context "when sort param is posts_count" do
      let(:sort_params) do
        {
          sort_param: "posts_count"
        }
      end

      it "returns users sorted by posts_count" do
        expect(result).to match_array([first_user, third_user, second_user])
      end
    end
  end
end
