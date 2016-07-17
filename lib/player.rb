require './lib/ship'
require './lib/board'
class Player
  attr_reader :ships
  def initialize
    @ships = []
    @board = Board.new
  end
  def place_ship(starting,ending)
    @ships << Ship.new(starting, ending)
  end

  def guess_location(target)
    location_state = @board.check_location(target)

    if location_state == 'ship'
      ship = find_ship(target)
      ship.hit
      return @board.set_location(target, "hit")
    elsif location_state == 'empty'
      return @board.set_location(target, "miss")
    else
      return "try again, that target is #{location_state}"
    end
  end
end
