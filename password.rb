# frozen_string_literal: true

##
# Represents the code that is chosen at the start.
class Password < Code
  # Checks if a digit is in the correct location.
  def correct_digit?(digit, index) end

  # Checks if a digit exists in the password.
  def contains_digit?(digit) end
end
