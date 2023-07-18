# frozen_string_literal: true

require_relative 'Guess'

##
# Represents the AI for the codebreaker.
class CodeBreakerAI < CodeBreaker
  def initialize
    super
    @attempt = []
    @valid_digits = Code.new.valid_digits
    @possibilities = @valid_digits.permutation(4)
    @correct = 0
    @misplaced = 0
    @try = 0
  end

  def update(misplaced, correct)
    @misplaced = misplaced
    @correct = correct
    @possibilities = eliminate_candidates
  end

  def eliminate_candidates
    test_guess = Guess.new(*@attempt)
    @possibilities.select do |possibility|
      test_pass = Password.new(*possibility)
      test_guess.count_correct_digits(test_pass) == @correct &&
        test_guess.count_misplaced_digits(test_pass) == @misplaced &&
        !test_pass.correct_guess?(test_guess)
    end
  end

  # Queries AI for a new attempt at guessing the password.
  def query_guess
    if @try.zero?
      @attempt = [1, 1, 2, 2]
      @attempt = Array.new(4, valid_digits[0]) if @valid_digits.length == 1
    else
      @attempt = @possibilities[0]
    end

    @try += 1
    Guess.new(*@attempt)
  end
end
