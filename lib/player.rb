require './lib/ship'
require './lib/board'
require './data/constants'
class Player
  attr_reader :ships
  def initialize(difficulty = "easy")
    @ships = []
    @difficulty = difficulty
    @board = Board.new(difficulty)
  end
  def place_ship(starting,ending)
    # if @board.validate_ship_placement(starting,ending)
    #   @ships << Ship.new(starting, ending)
    # end
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
