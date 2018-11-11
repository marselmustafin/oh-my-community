require "rails_helper"

describe Posts::SearchQuery do
  subject(:query) { described_class.new(keywords) }

  let(:keywords) { "" }

  let(:user) { create :user, full_name: "Martin Flowers" }
  let(:post) { create :post, title: "My cool story", author: user }

  let(:another_user) { create :user, full_name: "Mark Sanders" }
  let(:another_post) { create :post, title: "Scary tale", author: another_user }

  describe "#all" do
    subject(:result) { query.all }

    context "when search params are blank" do
      it "return all posts" do
        expect(result).to match_array([post, another_post])
      end
    end

    context "when post title keywords specified" do
      let(:keywords) { "cool story" }

      it "returns matched posts" do
        expect(result).to match_array([post])
      end
    end

    context "when author name keywords specified" do
      let(:keywords) { "Sanders" }

      it "returns matched posts" do
        expect(result).to match_array([another_post])
      end
    end
  end
end
