require_relative "./payload_encoder"

module MilleFeuille
  module Code128
    class Payload
      # @param payload [String]
      def initialize(payload)
        @payload = payload
      end

      # @param height [Integer]
      # @return [String]
      def svg(height:)
        encoder = PayloadEncoder.new
        BarSymbol.new(encoder.encode(@payload)).svg(height: height)
      end
    end
  end
end
