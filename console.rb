# frozen_string_literal: true

##
# Represents the console interface for Mastermind.
class Console
  # Prints codebreaker victory message to console.
  def show_codebreaker_win(guesses) end

  # Prints codemaker victory message to console.
  def show_codemaker_win
  end

  # Asks if codemaker should be AI or player.
  def query_codemaker_type
  end

  # Asks if codebreaker should be AI or player.
  def query_codebreaker_type
  end

  # Requests a new password.
  def query_password
  end

  # Informs user of password selection error.
  def inform_password_error
  end
end