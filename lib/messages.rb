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
    "QUITTER"
  end

  def self.difficulty
    "Choose a difficulty setting! Enter 1 for 'Easy', 2 for 'Medium' or 3 for 'Hard':"
  end

  def self.ask_for_guess
    "It's your move! Give me a target, something like 'a1'"
  end

  def self.hit(target, status)
    "There's a ship at #{target}! It is #{status}"
  end

  def self.bad_guess(status)
    "Guess again! That location is #{status}"
  end
end
