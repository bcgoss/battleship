require './test/test_helper'
require './lib/human_player'

class HumanPlayerTest < Minitest::Test
  def test_it_checks_input
    player = HumanPlayer.new
    assert player.check_placement_input(["a1", "a2"])
  end
end
