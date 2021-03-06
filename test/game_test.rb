require './test/test_helper'
require './lib/game'

class GameTest < Minitest::Test
  def test_creates_two_players
    skip
    game = Game.new
    assert_equal 2, game.players.count
  end

  def test_win_condition
    skip
    game = Game.new
    game.players.each do |player|
      player.ships.each do |ship|
        ship.size.times {ship.hit}
      end
    end
    assert game.won?
  end
end
