# frozen_string_literal: true

require_relative 'Password'

##
# Represents the player making the code to be guessed.
class CodeMaker
  def initialize
    @console = Console.new
  end

  # Queries for a new password.
  def query_password
    loop do
      @password = Password.new(*@console.query_password.split(',').map(&:to_i))
    rescue ArgumentError
      @console.inform_password_error
    else
      break
    end
    @password
  end
end
