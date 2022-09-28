require_relative "../common_bar_symbol"
require_relative './element_pattern'

module MilleFeuille
  module Code128
    class BarSymbol
      # @param character_values [Array<Integer>] Character values without the check character and the STOP character
      def initialize(character_values)
        @character_values = character_values

        if @character_values.any? { |n| !n.between?(0, 105) }
          raise ArgumentError.new("Character value must be 0-105")
        end
      end

      # @param height [Integer]
      # @return [String]
      def svg(height:)
        pattern = [
          ElementPattern::QUIET_ZONE,
          @character_values.map { |n| ElementPattern::CHARACTER_VALUES[n] },
          ElementPattern::CHARACTER_VALUES[check_character_value],
          ElementPattern::STOP_CHARACTER,
          ElementPattern::QUIET_ZONE,
        ].flatten

        CommonBarSymbol.new(pattern).svg(height: height)
      end

      private

      # @return [Integer] Mod-103 check character value
      def check_character_value
        start_character_value = @character_values[0]
        data_character_values = @character_values[1..-1]
        weighted_sum = start_character_value * 1 + data_character_values.map.with_index(1) { |value, weight| value * weight }.sum
        weighted_sum % 103
      end
    end
  end
end
