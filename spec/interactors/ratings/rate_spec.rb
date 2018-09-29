require "rails_helper"

describe Ratings::Rate do
  let(:expected_interactors) do
    [
      Ratings::Create,
      Ratings::UpdateAverageRatings
    ]
  end

  it "organizes expected interactors" do
    expect(described_class.organized).to eq(expected_interactors)
  end
end
