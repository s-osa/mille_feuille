# frozen_string_literal: true

RSpec.describe MilleFeuille::Code128::BarSymbol do
  describe "#svg" do
    let(:bar_symbol) { described_class.new(pattern) }
    let(:pattern) { [105, 0, 1, 2, 3, 4] }

    it "returns SVG string" do
      expect(bar_symbol.svg(height: 10)).to be_an_instance_of(String)
    end
  end

  describe "::NUMBER_PATTERNS" do
    it "has unique 105 patterns" do
      expect(described_class::NUMBER_PATTERNS.uniq.size).to eq(105)
    end

    it "has 11-module patterns" do
      described_class::NUMBER_PATTERNS.each do |pattern|
        expect(pattern.size).to eq(11)
      end
    end

    it "has 3 black bars and 3 white bars" do
      described_class::NUMBER_PATTERNS.each do |pattern|
        number_of_bars = pattern.chunk_while { |a, b| a == b }.to_a.size
        expect(number_of_bars).to eq(6)
      end
    end
  end

  describe "::STOP_PATTERN" do
    it "has 13-module patterns" do
      expect(described_class::STOP_PATTERN.size).to eq(13)
    end

    it "has 4 black bars and 3 white bars" do
      number_of_bars = described_class::STOP_PATTERN.chunk_while { |a, b| a == b }.to_a.size
      expect(number_of_bars).to eq(7)
    end
  end

  describe "::QUIET_PATTERN" do
    it "has 10-module patterns" do
      expect(described_class::QUIET_PATTERN.size).to eq(10)
    end

    it "has 1 white bar" do
      number_of_bars = described_class::QUIET_PATTERN.chunk_while { |a, b| a == b }.to_a.size
      expect(number_of_bars).to eq(1)
    end
  end
end
