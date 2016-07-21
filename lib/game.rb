require './lib/drawer'
require './lib/player'
class Game
  attr_reader :won,
              :difficulty,
              :players
  def initialize
    @difficulty = set_difficulty
    @players = create_players(difficulty)
    @players.each {|player| place_ships(player, difficulty)}
  end

  def set_difficulty
    choice = ""
    until ["1","2","3"].include? choice
      puts Messages.difficulty
      choice = gets.chomp
    end
    :easy if choice == 1
    :medium if choice == 2
    :hard if choice == 3
  end

  def create_players(difficulty)
    players = [Player.new(difficulty)]
    players << AIPlayer.new(difficulty)
  end

  def place_ship(player, difficulty)
    if difficulty == :easy
      largest_ship = 3
    elsif difficulty == :medium
      largest_ship = 4
    else
      largest_ship = 5
    end
  end

  def self.start
    until won?
      won = human_player_turn
      won = computer_player_turn unless won?
    end
    #tear_down
  end
  def human_player_turn
    display_my_guesses
    ask_for_guess
    display_my_guesses
    wait_for_enter
  end
  def computer_player_turn
    ai_player_guess
    display_opponent_guesses
    wait_for_enter
  end
  def won?
    won
  end

  def display_my_guesses(player)
    @drawer.display_my_guesses(player)
  end

  def display_opponent_guesses(player)
    @drawer.display_opponent_guesses(player)
  end

  def ask_for_guess
    valid_guess = false
    until valid_guess
      puts Messages.ask_for_guess
      response = player.guess_location(gets.chomp.downcase)
      if response == :hit
        puts Messages.hit
        valid_guess = true
      elsif response == :miss
        puts Messages.miss
        valid_guess = true
      else
        puts Messages.bad_guess(response)
      end
    end
  end
end
