# frozen_string_literal: true

##
# Represents the core logic of the game.
class GameLogic
  def initialize
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

  # Runs main game loop.
  def gameloop(codemaker_type, codebreaker_type)
  end
end

GameLogic.new
