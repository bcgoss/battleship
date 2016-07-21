require './lib/drawer'
require './lib/ai_player'
require './lib/human_player'
require 'pry'
class Game
  attr_reader :difficulty,
              :players
  def initialize
    system("clear")
    @difficulty = set_difficulty
    @players = create_players(difficulty)
    hide_ships_on_opponents_board
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
  def human_player
    players[0]
  end
  def computer_player
    players[1]
  end

  def hide_ships_on_opponents_board
    if difficulty == :easy
      largest_ship = 3
    elsif difficulty == :medium
      largest_ship = 4
    elsif difficulty == :hard
      largest_ship = 5
    end
    (2..largest_ship).each do |size|
      computer_player.place_ship(size,human_player.board)
      human_player.place_ship(size, computer_player.board)
      system("clear")
      puts Drawer.draw_board(computer_player.board, :mine)
      puts Messages.your_ships
    end
  end

  def start
    until won?
      human_player_turn
      computer_player_turn unless won?
    end
    puts Messages.game_over
    wait_for_enter
  end

  def won?
    players.any? do |player|
      player.ships.all? do |ship|
        ship.size <= ship.hits
      end
    end
  end

  def human_player_turn
    display_my_guesses(human_player.board)
    ask_for_guess
    display_my_guesses(human_player.board)
    wait_for_enter
  end
  def computer_player_turn
    guess = computer_player.generate_a_target
    if computer_player.guess_location(guess) == :hit
      human_player.find_ship(guess).hit
    end
    display_opponent_guesses(computer_player.board)
    wait_for_enter
  end

  def display_my_guesses(player)
    puts Drawer.draw_board(player, :opponent)
    puts Messages.my_guesses
  end
  def display_opponent_guesses(player)
    puts Drawer.draw_board(player, :mine)
    puts Messages.opponent_guesses
  end

  def ask_for_guess
    valid_guess = false
    until valid_guess
      puts Messages.ask_for_guess
      guess = gets.chomp.downcase
      system "clear"
      response = human_player.guess_location(guess)
      if response == :hit
        puts Messages.hit(guess, computer_player.find_ship(guess).hit)
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
