require "builder"

module MilleFeuille
  class BarSymbol
    # @param pattern [Array<Integer>] Array of 0 (white) or 1 (black).
    def initialize(pattern)
      @pattern = pattern
    end

    # @param height [Integer]
    # @return [String]
    def svg(height:)
      x = 0
      builder = Builder::XmlMarkup.new(indent: 2)
      builder.instruct!(:xml, version: '1.0', encoding: 'UTF-8')
      builder.svg(xmlns: 'http://www.w3.org/2000/svg', width: @pattern.size, height: height) { |svg|
        svg.rect(x: 0, y: 0, width: @pattern.size, height: height, fill: 'white')
        pattern_chunks.each do |pattern_chunk|
          svg.rect(x: x, y: 0, width: pattern_chunk.size, height: height, fill: chunk_color(pattern_chunk))
          x += pattern_chunk.size
        end
      }
      builder.target!.to_s
    end

    private

    # @return [Enumerator]
    def pattern_chunks
      @pattern.chunk_while { |a, b| a == b }
    end

    def chunk_color(chunk)
      case chunk.first
      when 0
        "white"
      when 1
        "black"
      else
        raise RuntimeError.new("#{chunk.first} is not valid pattern. It must be 0 or 1.")
      end
    end
  end
end
