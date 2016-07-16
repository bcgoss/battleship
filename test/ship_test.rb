require './test/test_helper'
require './lib/ship'
require './lib/location'
class ShipTest < Minitest::Test
  def test_it_exists
    assert Ship.new(2)
  end

  def test_ships_have_sizes
    submarine = Ship.new(2)

    assert_equal 2, submarine.size
  end

  def test_ships_have_locations
    start = Location
    submarine = Ship.new()
  end
end
