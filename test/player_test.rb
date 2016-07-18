require './test/test_helper'
require './lib/player'
require './lib/ship'

class PlayerTest < Minitest::Test
  def setup
    #things go here
  end
  def test_it_can_place_ships
    player1 = Player.new
    player1.place_ship("a1","a2")
    assert_equal 1, player1.ships.count
  end

  def placed_ships_cannot_cross
    player1 = Player.new
    player1.place_ship("a1","a2")
    player1.place_ship("a1", "b1")
    assert_equal 1, player1.ships.count
  end

  def test_it_can_guess_locations
    player1 = Player.new
    assert_equal "miss", player1.guess_location("a1")
    
    player1.place_ship("a1","a2")
    assert_equal "hit", player1.guess_location("a2")
  end
end
