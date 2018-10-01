describe SubdomainValidator do
  subject(:model) { Test.new(subdomain: subdomain) }

  class Test
    include ActiveModel::Model

    attr_accessor :subdomain

    validates :subdomain, subdomain: true
  end

  let(:subdomain) { "my-community" }

  describe "#validate_each" do
    subject { model.errors.messages[:subdomain] }

    before do
      model.valid?
    end

    it { is_expected.to be_empty }

    context "when subdomain has reserved name" do
      let(:subdomain) { "admin" }

      it { is_expected.to eq(["is reserved"]) }
    end

    context "when subdomain starts with dash" do
      let(:subdomain) { "-my-community" }

      it { is_expected.to eq(["can't start with dash"]) }
    end

    context "when subdomain ends with dash" do
      let(:subdomain) { "my-community-" }

      it { is_expected.to eq(["can't end with dash"]) }
    end
  end
end
