require_relative "../common_bar_symbol"
require_relative './element_pattern'

module MilleFeuille
  module Code128
    class BarSymbol
      # @param character_values [Array<Integer>] Character values with the check character without the STOP character
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
          ElementPattern::STOP_CHARACTER,
          ElementPattern::QUIET_ZONE,
        ].flatten

        CommonBarSymbol.new(pattern).svg(height: height)
      end
    end
  end
end
