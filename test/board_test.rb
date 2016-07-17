require './test/test_helper'
require './lib/board'
class BoardTest < Minitest::Test
  def test_board_exists
    assert Board.new
  end

  def test_it_sets_board_size
    board = Board.new
    assert_equal 4, board.set_board(4)
  end

  def test_has_locations
    board = Board.new
    assert_equal "empty", board.check_location("a1")
  end
  def test_more_locations
    board = Board.new
    assert_equal "empty", board.check_location("d4")
  end

  def test_it_can_be_bigger
    board = Board.new("medium")
    assert_equal "empty", board.check_location("h8")
  end
  def test_it_can_be_even_bigger
    board = Board.new("hard")
    assert_equal "empty", board.check_location("L12")
  end

  def test_it_handles_out_of_bounds
    board= Board.new
    assert_equal "out of bounds", board.check_location("M13")
  end

  def test_it_controls_location_states
    board = Board.new
    assert_equal "hit", board.set_location("a1", "hit")
  end
end
