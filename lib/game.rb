require './lib/drawer'
require './lib/ai_player'
require './lib/human_player'
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
    return :easy if choice == "1"
    return :medium if choice == "2"
    return :hard if choice == "3"
  end

  def create_players(difficulty)
    players = [HumanPlayer.new(difficulty)]
    players << AIPlayer.new(difficulty)
  end

  def place_ships(player, difficulty)
    if difficulty == :easy
      largest_ship = 3
    elsif difficulty == :medium
      largest_ship = 4
    else
      largest_ship = 5
    end
    (2..largest_ship).each do |size|
      player.place_ship(size)
    end
  end

  def start
    until won?
      won = human_player_turn
      won = computer_player_turn unless won?
    end
    #tear_down
  end

  def human_player_turn
    display_my_guesses(players[1].board)
    ask_for_guess
    display_my_guesses(players[1].board)
    wait_for_enter
  end

  def computer_player_turn
    players[1].guess_location
    display_opponent_guesses(players[0].board)
    wait_for_enter
  end

  def won?
    players.each do |player|
      player.ships.each do |ship|
        return false if ship.size > ship.hits
      end
    end
    true
  end

  def display_my_guesses(player)
    Drawer.draw_board(player, :mine)
  end

  def display_opponent_guesses(player)
    Drawer.draw_board(player, :opponent)
  end

  def ask_for_guess
    valid_guess = false
    until valid_guess
      puts Messages.ask_for_guess
      guess = gets.chomp.downcase
      response = players[0].guess_location(guess)
      if response == :hit || response == :sunk
        puts Messages.hit(guess, response)
        valid_guess = true
      elsif response == :miss
        puts Messages.miss(guess)
        valid_guess = true
      else
        puts Messages.bad_guess(response)
      end
    end
  end

  def wait_for_enter
    puts Messages.enter
    gets.chomp
    system "clear"
  end
end
