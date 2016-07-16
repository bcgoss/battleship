require './test/test_helper'
require './lib/ship'

class ShipTest < Minitest::Test
  def test_it_exists
    assert Ship.new
  end
end
