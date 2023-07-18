# frozen_string_literal: true

##
# Represents a code in Mastermind.
class Code
  def initialize(*digits)
    @code = if digits.length == 4
              [digits[0], digits[1], digits[2], digits[3]]
            elsif digits.empty?
              [nil, nil, nil, nil]
            else
              raise ArgumentError, 'Argument should consist of four digits'
            end
  end
end
