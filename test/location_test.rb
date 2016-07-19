require './test/test_helper'
require './lib/location.rb'

class LocationTest < Minitest::Test
  def test_locations_exist
    assert Location.new
  end

  def test_locations_start_empty
    assert_equal "empty", Location.new.state
  end

  def test_locations_can_hold_ships
    location = Location.new
    location.add_ship

    assert_equal "ship", location.state
  end

  def test_location_records_a_hit
    location = Location.new
    location.record_hit
    assert_equal "hit", location.state
  end

  def test_location_records_a_miss
    location = Location.new
    location.record_miss
    assert_equal "miss", location.state
  end

  def test_locations_can_check_for_ships
    location = Location.new

    refute location.ship?
    location.add_ship
    assert location.ship?
    
  end
end
