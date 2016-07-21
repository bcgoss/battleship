require './lib/ship'
require './lib/board'

class Player
  attr_reader :ships
  attr_accessor :board
  def initialize(difficulty = :easy)
    @ships = []
    # @difficulty = difficulty
    @board = Board.new(difficulty)
  end

  def place_ship(starting, ending, ship_size, other_board)
    response = other_board.validate_ship_placement(starting, ending, ship_size)
    if response == true
      range = other_board.get_location_range(starting, ending)
      @ships << Ship.new(range, ship_size)
      range.each do |target|
        other_board.location[target].add_ship
      end
      return other_board
    else
      return response
    end
  end

  def find_ship(target_location)
    @ships.each do |ship|
      return ship if ship.locations.include?(target_location)
    end
  end

  def guess_location(target)
    board_response = @board.guess_location(target)
    # if board_response == :hit #result.is_a_ship?
    #   return find_ship(target).hit
    # end
    # board_response
  end
end
