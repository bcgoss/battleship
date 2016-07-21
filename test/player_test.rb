require './test/test_helper'
require './lib/player'
require './lib/ship'

class PlayerTest < Minitest::Test
  def test_it_can_place_ships
    player1 = Player.new
    player1.place_ship("a1","a2", 2)
    assert_equal 1, player1.ships.count
  end

  def placed_ships_cannot_cross
    player1 = Player.new
    player1.place_ship("a1","a2", 2)
    player1.place_ship("a1", "b1", 2)
    assert_equal 1, player1.ships.count
  end

  def test_it_can_guess_locations
    player1 = Player.new
    assert_equal :miss, player1.guess_location("a1")

    player1.place_ship("a1","a2", 2)
    assert_equal :hit, player1.guess_location("a2")
    expect = "Guess again! That location is out of bounds"
    assert_equal expect, player1.guess_location("a12")
  end

  def test_guessing_the_same_location_twice
    player = Player.new
    player.guess_location("a1")
    assert_equal "Guess again! That location is miss", player.guess_location("a1")
  end

  def test_players_know_if_a_ship_exists_at_location
    player = Player.new
    player.place_ship("a1","a2",2)
    target_location = "a1"
    ship = player.find_ship(target_location)
    assert ship.locations.include?(target_location)
  end
end
