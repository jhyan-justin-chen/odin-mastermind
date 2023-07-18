# frozen_string_literal: true

require_relative 'Password'

##
# Represents the AI for the codemaker.
class CodeMakerAI < CodeMaker
  # Queries AI for a new password.
  def query_password
    valid_digits = Password.new.valid_digits
    Password.new(*Array.new(4) { valid_digits.sample })
  end
end
