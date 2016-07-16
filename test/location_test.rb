require './test/test_helper'
require './lib/location.rb'

class LocationTest < Minitest::Test
  def test_locations_exist
    assert Location.new
  end
  def test_locations_have_status
    assert "empty", Location.new.status
  end
end
