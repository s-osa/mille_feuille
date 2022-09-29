# frozen_string_literal: true

RSpec.describe MilleFeuille::Code128::BarSymbol do
  describe "#svg" do
    let(:bar_symbol) { described_class.new(pattern) }
    let(:pattern) { [105, 0, 1, 2, 3, 4, 5, 72] }

    it "returns SVG string" do
      expect(bar_symbol.svg(height: 10)).to be_an_instance_of(String)
    end
  end
end
