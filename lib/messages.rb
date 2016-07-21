module Messages
  def self.greeting
    "Welcome to BATTLESHIP\n\n"
  end

  def self.menu_message
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.information
    "who's going to read this?"
  end

  def self.farewell
    "Thank you for playing!!"
  end

  def self.difficulty
    "Choose a difficulty setting! Enter 1 for 'Easy', 2 for 'Medium' or 3 for 'Hard':"
  end

  def self.place_ship(size)
    "Place a ship! Give me two coordinates which span #{size} spots. Coordinates should be formatted like 'a1 a2'"
  end

  def self.placement_formatting
    "I didn't get that, can you try again?"
  end

  def self.straight_lines(starting, ending)
    "#{starting} and #{ending} don't form a straight line. Give me two different points in the same row or column"
  end

  def self.wrong_length(size)
    "The ship takes up #{size} spots. Try again, use #{size} spots, no more, no less."
  end

  def self.spot_occupied
    "This area is blocked by another ship! Try again!"
  end

  def self.ask_for_guess
    "It's your move! Give me a target, something like 'a1'"
  end

  def self.hit(target, status)
    "There's a ship at #{target}! It is #{status}"
  end

  def self.miss(target)
    "A clean shot at #{target} but it didn't hit anything."
  end

  def self.bad_guess(status)
    "Guess again! That location is #{status}"
  end

  def self.my_guesses
    "Here are your guesses so far"
  end

  def self.opponent_guesses
    "Here are your opponent's guesses so far"
  end

  def self.enter
    "Press Enter to continue"
  end

  def self.your_ships
    "Your fleet's configuration"
  end

  def self.game_over
    "That's the last of them! GAME OVER"
  end
end
