require "rails_helper"

describe Users::FilteredQuery do
  subject(:query) { described_class.new(filter_params) }

  let(:filter_params) { {} }

  let!(:first_user) { create :user, full_name: "Richard III", rating: 5.0 }
  let!(:second_user) { create :user, full_name: "John Travolta", rating: 3.5 }
  let!(:third_user) { create :user, full_name: "Carl Richmond", rating: 0.0 }

  describe "#all" do
    subject(:result) { query.all }

    context "when filter params are blank" do
      it "does not filter users" do
        expect(result).to match_array([first_user, second_user, third_user])
      end
    end

    context "when min rating specified" do
      let(:filter_params) do
        {
          min_rating: 3
        }
      end

      it "returns users with rating more than equal than specifed" do
        expect(result).to match_array([first_user, second_user])
      end
    end

    context "when keywords are specified" do
      let(:filter_params) do
        {
          keywords: "rich"
        }
      end

      it "returns users matched by keyword" do
        expect(result).to match_array([first_user, third_user])
      end
    end
  end
end
