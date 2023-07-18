# frozen_string_literal: true

##
# Represents the core logic of the game.
class GameLogic
  attr_accessor :tries

  def initialize(tries)
    raise ArgumentError, 'Argument should be greater than 0.' unless tries.positive?

    @tries = tries
    codemaker_type = query_codemaker_type
    codebreaker_type = query_codebreaker_type

    gameloop(codemaker_type, codebreaker_type)
  end

  # Asks if codemaker should be AI or player.
  def query_codemaker_type
  end

  # Asks if codebreaker should be AI or player.
  def query_codebreaker_type
  end

  # Prints codebreaker victory message to console.
  def print_codebreaker_win(guesses) end

  # Prints codemaker victory message to console.
  def print_codemaker_win
  end

  # Runs main game loop.
  def gameloop(codemaker_type, codebreaker_type)
    @codemaker = codemaker_type == 'AI' ? CodeMakerAI.new : CodeMaker.new
    @codebreaker = codebreaker_type == 'AI' ? CodeBreakerAI.new : CodeBreaker.new

    @password = @codemaker.query_password
    @guess = Guess.new

    1..@tries.each do |guess|
      @guess = @codebreaker.query_guess
      return print_codebreaker_win(guess) if @password.correct_guess?(@guess)
    end

    print_codemaker_win
  end
end

GameLogic.new
