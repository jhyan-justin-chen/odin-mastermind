# frozen_string_literal: true

##
# Represents the console interface for Mastermind.
class Console
  # Prints codebreaker victory message to console.
  def show_codebreaker_win(guesses)
    puts "The codebreaker has won, using #{guesses} guesses!"
  end

  # Prints codemaker victory message to console.
  def show_codemaker_win
    puts 'The codemaker has won!'
  end

  # Show hints for a guess.
  def show_guess_hints(exists, correct)
    puts "You have #{exists} digits that exist but are in the wrong position."
    puts "You have #{correct} digits that exist and are in the right position."
  end

  # Show guesses remaining.
  def show_guesses_remaining(guesses)
    puts "You have #{guesses} guesses remaining to guess the password."
  end

  def show_valid_digits(valid_digits)
    puts "The digits in play are #{valid_digits.join(', ')}."
  end

  # Asks if codemaker should be AI or player.
  def query_codemaker_type
    puts 'Who is playing the codemaker? (AI or Player)'
    gets.chomp
  end

  # Asks if codebreaker should be AI or player.
  def query_codebreaker_type
    puts 'Who is playing the codebreaker? (AI or Player)'
    gets.chomp
  end

  # Requests a new password.
  def query_password
    puts 'Please enter a new password. (#, #, #, #) e.g. 1, 2, 3, 4'
    gets.chomp
  end

  def query_guess
    puts 'Please guess the password. (#, #, #, #) e.g. 1, 2, 3, 4'
    gets.chomp
  end

  # Informs user of password selection error.
  def inform_password_error
    puts 'Your entered password was invalid.'
  end

  # Informs user of guess selection error.
  def inform_guess_error
    puts 'Your entered guess was invalid.'
  end
end
