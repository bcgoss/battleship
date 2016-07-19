require './lib/ship'
require './lib/board'
require './data/constants'
class Player
  include Constants
  attr_reader :ships
  def initialize(difficulty = "easy")
    @ships = []
    @difficulty = difficulty
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
    location_state = @board.check_location(target)

    if location_state == ship #result.is_a_ship?
      find_ship(target).hit
      return @board.set_location(target, hit)
    elsif location_state == empty
      return @board.set_location(target, miss)
    else
      return "try again, that target is #{location_state}"
    end
  end
end
