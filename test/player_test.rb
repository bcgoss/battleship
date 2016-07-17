require './test/test_helper'
require './lib/player'
require './lib/ship'

class PlayerTest < Minitest::Test

  def test_it_can_place_ships
    player1 = Player.new
    player1.place_ship("a1","a2")
    assert_equal 1, player1.ships.count
  end


  def test_it_can_guess_locations
    player1 = Player.new
    player.guess_location("a1")
    
  end
end
