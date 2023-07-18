# frozen_string_literal: true

require_relative 'Guess'

##
# Represents the player guessing the code.
class CodeBreaker
  def initialize
    @console = Console.new
  end

  # Queries for a new attempt at guessing the password.
  def query_guess
    loop do
      @guess = Guess.new(*@console.query_guess.split(',').map(&:to_i))
    rescue ArgumentError
      @console.inform_guess_error
    else
      break
    end
    @guess
  end
end
