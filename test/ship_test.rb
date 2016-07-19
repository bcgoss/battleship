require './test/test_helper'
require './lib/ship'
require './lib/location'
class ShipTest < Minitest::Test
  def test_ships_have_locations
    range = ["a1","a2"]
    submarine = Ship.new(range, 2)
    assert_equal range, submarine.locations
  end

  def test_ships_dont_know_the_rules
    #placement rules are checked before this method is called.
    #ships don't know how big the board is, so they don't know
    #which locations are valid.
    submarine = Ship.new(["a1","b2"], 2)
    assert_equal ["a1","b2"], submarine.locations
  end

  def test_ships_count_hits
    submarine = Ship.new("",2)
    assert_equal "hit", submarine.hit
  end
  def test_ships_sink_after_too_many_hits
    submarine = Ship.new('',2)
    submarine.hit
    assert_equal "sunk", submarine.hit
  end
end
