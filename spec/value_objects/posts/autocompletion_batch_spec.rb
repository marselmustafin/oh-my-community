require "rails_helper"

describe Posts::AutocompletionBatch do
  subject(:autocompletion_batch) { described_class.new(autocomplete_params) }

  let(:autocomplete_params) do
    {
      keywords: keywords,
      community: community
    }
  end

  let(:keywords) { "Bob" }
  let(:community) { create :community }

  let(:author) { create :user, full_name: "Bob Stewart" }
  let(:second_author) { create :user, full_name: "Bob Harrisson" }
  let(:third_author) { create :user, full_name: "Sam Smith" }

  let(:expected_matches) do
    [
      { match: "Bob Stewart \"How to write cool RSpec tests\"" },
      { match: "Bob Harrisson \"Guitar tapping tutorial\"" }
    ]
  end

  before do
    create :post, author: author, title: "How to write cool RSpec tests", community: community
    create :post, author: second_author, title: "Guitar tapping tutorial", community: community
    create :post, author: third_author, title: "Funny story", community: community
  end

  describe "#to_a" do
    subject(:result) { autocompletion_batch.to_a }

    it "returns batch of posts matches for specified keywords" do
      is_expected.to eq(expected_matches)
    end
  end
end
