require './test/test_helper'
require './lib/ai_player'

class AIPlayerTest < Minitest::Test
  def test_it_generates_a_target
    player = AIPlayer.new
    assert player.board.location.keys.include? player.generate_a_target
  end

  def test_it_generates_a_ship_placement
    player = AIPlayer.new

    assert_equal ["a1","a2"], player.generate_ship_placement(2)
  end
end
