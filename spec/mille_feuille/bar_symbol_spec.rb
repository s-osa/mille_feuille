# frozen_string_literal: true

RSpec.describe MilleFeuille::BarSymbol do
  describe "#svg" do
    let(:bar_symbol) { MilleFeuille::BarSymbol.new(pattern) }
    let(:pattern) { [0, 1, 0, 1, 0] }

    it "returns SVG string" do
      expect(bar_symbol.svg(height: 10)).to be_an_instance_of(String)
    end
  end
end
