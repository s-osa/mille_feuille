# frozen_string_literal: true

RSpec.describe MilleFeuille::Code128::Payload do
  describe "#svg" do
    let(:payload) { described_class.new(str) }
    let(:str) { "ABC-abc-123" }

    it "returns SVG string" do
      expect(payload.svg(height: 10)).to be_an_instance_of(String)
    end
  end
end
