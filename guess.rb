# frozen_string_literal: true

##
# Represents a guess at the code.
class Guess < Code
  # Gets the number of digits that are correct but in the wrong location.
  def count_misplaced_digits(password)
    (@code.select { |digit| password.contains_digit?(digit) }).length - count_correct_digits(password)
  end

  # Gets the number of digits that are correct and in the right location.
  def count_correct_digits(password)
    @code.select.with_index { |digit, index| password.correct_digit?(digit, index) }.length
  end
end
