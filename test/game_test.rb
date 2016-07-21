require './test/test_helper'
require './lib/game'

class GameTest < Minitest::Test
  def test_creates_two_players
    skip
    game = Game.new
    assert_equal 2, game.players.count
  end
end
