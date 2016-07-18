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

  def test_players_cannot_break_rules
    
  end

  def test_it_can_guess_locations
    player1 = Player.new
    result = player1.guess_location("a1")

    assert_equal "miss", result
  end
end
