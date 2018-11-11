require "rails_helper"

describe Users::AutocompletionBatch do
  subject(:autocompletion_batch) { described_class.new(autocompletion_params) }

  let(:autocompletion_params) do
    {
      keywords: keywords,
      community: community
    }
  end

  let(:keywords) { "Bob" }
  let(:community) { create :community }

  let(:expected_matches) do
    [
      { match: "Bob Stewart bob@steward.com" },
      { match: "Bob Harrisson bobharrisson@gmail.com" }
    ]
  end

  before do
    create :user, full_name: "Bob Stewart", email: "bob@steward.com", community: community
    create :user, full_name: "Bob Harrisson", email: "bobharrisson@gmail.com", community: community
    create :user, full_name: "Sam Smith", email: "samuel@mail.ru", community: community
  end

  describe ".to_a" do
    subject(:result) { autocompletion_batch.to_a }

    it "returns batch of users matches for specified keywords" do
      is_expected.to eq(expected_matches)
    end
  end
end
