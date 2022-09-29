# frozen_string_literal: true

RSpec.describe MilleFeuille::Code128::PayloadEncoder do
  describe "#encode" do
    let(:encoder) { described_class.new }

    it "returns character values with start character and check character" do
      expect(encoder.encode("abc123")).to eq([104, 65, 66, 67, 17, 18, 19, 53])
    end
  end
end
