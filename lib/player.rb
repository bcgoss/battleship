require './lib/ship'
require './lib/board'

class Player
  attr_reader :ships
  def initialize(difficulty = :easy)
    @ships = []
    # @difficulty = difficulty
    @board = Board.new(difficulty)
  end

  def place_ship(starting, ending, ship_size)
    if @board.validate_ship_placement(starting, ending, ship_size)
      range = @board.get_location_range(starting, ending)
      @ships << Ship.new(range, ship_size)
      range.each do |target|
        @board.location[target].add_ship
      end
    end
  end

  def find_ship(target_location)
    @ships.each do |ship|
      return ship if ship.locations.include?(target_location)
    end
  end

  def guess_location(target)
    board_response = @board.location_guess(target)
    # location_state = @board.check_location(target)

    if board_response == :hit #result.is_a_ship?
      return find_ship(target).hit
    end
    board_response
  end
end
