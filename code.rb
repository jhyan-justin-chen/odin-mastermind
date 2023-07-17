# frozen_string_literal: true

##
# Represents a code in Mastermind.
class Code
  def initialize(digit1, digit2, digit3, digit4)
    @code = [digit1, digit2, digit3, digit4]
  end
end
