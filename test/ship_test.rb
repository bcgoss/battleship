require './test/test_helper'
require './lib/ship'
require './lib/location'
class ShipTest < Minitest::Test
  def test_ships_have_locations
    start = "a1"
    ending = "a2"
    submarine = Ship.new(start, ending)
    assert_equal [start, ending], submarine.locations
  end

  def test_ships_dont_know_the_rules
    submarine = Ship.new("a1","b2")
    assert_equal ["a1","b2"], submarine.locations
  end

  def test_ships_count_hits
    submarine = Ship.new("","")
    assert_equal "hit", submarine.hit
  end
  def test_ships_sink_after_too_many_hits
    submarine = Ship.new('','')
    submarine.hit
    assert_equal "sunk", submarine.hit
  end
end
