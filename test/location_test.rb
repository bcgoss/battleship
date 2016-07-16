require './test/test_helper'
require './lib/location.rb'

class LocationTest < Minitest::Test
  def test_locations_exist
    assert Location.new
  end
end
