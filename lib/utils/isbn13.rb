# frozen_string_literal: true

module Utils
  class Isbn13
    def self.valid?(isbn)
      return false if isbn.nil?

      raise ArgumentError, 'Invalid ISBN length. Expected 13 (ISBN-13) digits.' if isbn.length != 13

      check_digit = calculate_check_digit(isbn[0..11])
      check_digit == isbn[-1]
    end

    # Calculates the check digit for a 12-digit ISBN-13
    #
    # The algorithm is:
    # 
    # 1. Take each digit, from left to right and multiply them alternatively by 1 and 3
    # 2. Sum those numbers
    # 3. Take mod 10 of the summed figure
    # 4. Subtract 10 and if the end number is 10, make it 0
    # 
    # Example for 978014300723:
    # 
    # 1. (9×1) + (7×3) + (8×1) + (0×3) + (1×1) + (4×3) + (3×1) + (0×3) + (0×1) + (7×3) + (2×1) + (3×3)
    # 2. 86
    # 3. 86 mod 10 = 6
    # 4. 10 - 6 = 4
    # 
    # Therefore the complete ISBN is: 9780143007234
    #
    # @param isbn [String] A 12-digit ISBN string (without the check digit)
    # @return [String] The computed check digit (0-9)
    # @raise [ArgumentError] If the ISBN is not exactly 12 digits

    def self.calculate_check_digit(isbn)
      if isbn.length != 12
        raise ArgumentError, 'Invalid ISBN length. Expected 12 (ISBN-13) digits, the 13th digit is calculated.'
      end

      sum = 0
      isbn.chars.each_with_index do |digit, i|
        multiplier = (i.even? ? 1 : 3)
        sum += digit.to_i * multiplier
      end
      check_digit = (10 - (sum % 10)) % 10
      check_digit.to_s
    end
  end
end
