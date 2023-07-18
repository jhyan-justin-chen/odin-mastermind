# frozen_string_literal: true

##
# Represents the code that is chosen at the start.
class Password < Code
  # Checks if a digit is in the correct location.
  def correct_digit?(digit, index)
    @code[index] == digit
  end

  # Checks if a digit exists in the password.
  def contains_digit?(digit)
    @code.include?(digit)
  end

  # Checks if the guess is fully correct.
  def correct_guess?(guess)
    @code == guess
  end

  def nil?
    @code.all?(&:nil?)
  end
end
