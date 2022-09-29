module MilleFeuille
  module Code128
    class PayloadEncoder
      module CharacterValue
        START_A = 103
        START_B = 104
        START_C = 105
      end

      # @param payload [String]
      # @return [Array<Integer>] Character values with start character and check character
      # TODO: Support code A and code C
      # TODO: Optimize symbol length
      def encode(payload)
        character_values = []
        character_values << CharacterValue::START_B

        payload.chars.each do |character|
          character_values << code_b(character)
        end

        character_values << check_character_value(character_values)

        character_values
      end

      private

      # @param character [String]
      # @return [Integer]
      def code_a(character)
        codepoint = character.ord

        case codepoint
        when 0..31
          codepoint + 64
        when 32..95
          codepoint - 32
        else
          raise RuntimeError.new("#{character} (codepoint: #{codepoint}) is invalid as code A character")
        end
      end

      # @param character [String]
      # @return [Integer]
      def code_b(character)
        codepoint = character.ord

        case codepoint
        when 32..127
          codepoint - 32
        else
          raise RuntimeError.new("#{character} (codepoint: #{codepoint}) is invalid as code B character")
        end
      end

      # @param two_digit_string [String]
      # @return [Integer]
      def code_c(two_digit_string)
        case two_digit_string
        when /\A\d{2}\z/
          two_digit_string.to_i
        else
          raise RuntimeError.new("#{two_digit_string} is invalid as code C character")
        end
      end

      # @param character_values [Array<Integer>]
      # @return [Integer] Mod-103 check character value
      def check_character_value(character_values)
        start_character_value = character_values[0]
        data_character_values = character_values[1..-1]
        weighted_sum = start_character_value * 1 + data_character_values.map.with_index(1) { |value, weight| value * weight }.sum
        weighted_sum % 103
      end
    end
  end
end
