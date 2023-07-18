# frozen_string_literal: true

##
# Represents a code in Mastermind.
class Code
  NUM_TYPES = 5

  def initialize(*digits)
    raise ArgumentError, 'Invalid code' unless valid?(digits)

    @code = digits.nil? ? [nil, nil, nil, nil] : [digits[0], digits[1], digits[2], digits[3]]
  end

  def valid_digits
    (1..NUM_TYPES).to_a
  end

  def valid?(digits)
    return true if digits.empty?
    return false unless digits.length == 4
    return false unless (digits - valid_digits).empty?

    true
  end
end
