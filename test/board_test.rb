require './test/test_helper'
require './lib/board'
class BoardTest < Minitest::Test
  def test_board_exists
    assert Board.new
  end

  def test_it_sets_board_size
    assert_equal 4, Board.new.size
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

  def test_it_can_spot_rows
    board = Board.new
    assert_equal "row", board.row_or_column("a1", "a4")
  end

  def test_it_can_spot_columns
    board = Board.new
    assert_equal "column", board.row_or_column("a1", "c1")
  end

  def test_it_spots_diagonals
    assert_equal "neither", Board.new.row_or_column("a1", "d4")
  end

  def test_it_finds_range_of_locations
    board = Board.new
    assert_equal ["a1","a2"], board.get_location_range("a1", "a2")
    assert_equal ["a1","b1"], board.get_location_range("a1","b1")
    assert_equal ["a1","b1","c1"], board.get_location_range("a1", "c1")
    assert_equal ["a1","a2","a3"], board.get_location_range("a1","a3")
  end

  def test_it_calculates_row_distance
    assert_equal 4, Board.new.distance("a1", "a4")
    assert_equal 3, Board.new.distance("a1", "c1")
  end

  def test_it_validiates_ship_placement
    assert_respond_to Board.new, :validate_ship_placement
  end
end
