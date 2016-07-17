require './lib/ship'
class Player
  attr_reader :ship
  def initialize
    @ships = []
  end
  def place_ship(starting,ending)
    @ships << Ship.new(starting, ending)
  end

  def guess_location(target)

  end
end
