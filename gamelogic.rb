# frozen_string_literal: true

require_relative 'Console'
require_relative 'CodeMaker'
require_relative 'CodeMaker_AI'
require_relative 'CodeBreaker'
require_relative 'CodeBreaker_AI'
require_relative 'Code'

##
# Represents the core logic of the game.
class GameLogic
  attr_accessor :tries

  def initialize(tries)
    raise ArgumentError, 'Argument should be greater than 0.' unless tries.positive?

    @tries = tries
    @console = Console.new
    codemaker_type = @console.query_codemaker_type until %w[AI Player].include?(codemaker_type)
    codebreaker_type = @console.query_codebreaker_type until %w[AI Player].include?(codebreaker_type)

    gameloop(codemaker_type, codebreaker_type)
  end

  # Runs main game loop.
  def gameloop(codemaker_type, codebreaker_type)
    @codemaker = codemaker_type == 'AI' ? CodeMakerAI.new : CodeMaker.new
    @codebreaker = codebreaker_type == 'AI' ? CodeBreakerAI.new : CodeBreaker.new

    @console.show_valid_digits(Code.new.valid_digits)

    @password = @codemaker.query_password
    @guess = Guess.new

    (1..@tries).each do |guess|
      @console.show_guesses_remaining(@tries - guess + 1)
      @guess = @codebreaker.query_guess

      misplaced = @guess.count_misplaced_digits(@password)
      correct = @guess.count_correct_digits(@password)

      @codebreaker.update(misplaced, correct) if codemaker_type == 'AI'

      @console.show_guess_hints(misplaced, correct)
      return @console.show_codebreaker_win(guess) if @password.correct_guess?(@guess)
    end

    @console.show_codemaker_win
  end
end

GameLogic.new(5)
