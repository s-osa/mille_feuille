# frozen_string_literal: true

RSpec.describe MilleFeuille::Code128::ElementPattern do
  describe "::CHARACTER_VALUES" do
    it "has unique 105 patterns" do
      expect(described_class::CHARACTER_VALUES.uniq.size).to eq(105)
    end

    it "has 11-module patterns" do
      described_class::CHARACTER_VALUES.each do |pattern|
        expect(pattern.size).to eq(11)
      end
    end

    it "has 3 black bars and 3 white bars" do
      described_class::CHARACTER_VALUES.each do |pattern|
        number_of_bars = pattern.chunk_while { |a, b| a == b }.to_a.size
        expect(number_of_bars).to eq(6)
      end
    end
  end

  describe "::STOP_CHARACTER" do
    it "has 13-module patterns" do
      expect(described_class::STOP_CHARACTER.size).to eq(13)
    end

    it "has 4 black bars and 3 white bars" do
      number_of_bars = described_class::STOP_CHARACTER.chunk_while { |a, b| a == b }.to_a.size
      expect(number_of_bars).to eq(7)
    end
  end

  describe "::QUIET_ZONE" do
    it "has 10-module patterns" do
      expect(described_class::QUIET_ZONE.size).to eq(10)
    end

    it "has 1 white bar" do
      number_of_bars = described_class::QUIET_ZONE.chunk_while { |a, b| a == b }.to_a.size
      expect(number_of_bars).to eq(1)
    end
  end
end
