require './test/test_helper'
require './lib/drawer'
require './lib/board'

class DrawerTest < Minitest::Test
  def test_it_shows_equals
    assert_equal " =  =  =  =  = ", Drawer.draw_row_of_equals(4)
  end

  def test_it_shows_number_header
    assert_equal " .  1  2  3  4 ", Drawer.draw_row_of_numbers(4)
  end

  def test_it_draws_the_play_area_with_row
    board = Board.new
    assert_equal [[" a ", "   ", "   ", "   ", "   "], [" b ", "   ", "   ", "   ", "   "], [" c ", "   ", "   ", "   ", "   "], [" d ", "   ", "   ", "   ", "   "]]\
    , Drawer.draw_my_rows(board, 4)
  end

  def test_it_shows_a_board_with_ships
    board = Board.new
    board.set_location("a1", :hit)
    board.set_location("a2", :miss)
    board.location["b1"].add_ship
    assert_equal [" =  =  =  =  = ", " .  1  2  3  4 ", " a  H  M       ", " b  S          ", " c             ", " d             ", " =  =  =  =  = "]\
    , Drawer.draw_board(board, :mine)
  end

  def test_it_shows_a_board_hiding_ships
    board = Board.new
    board.set_location("a1", :hit)
    board.set_location("a2", :miss)
    board.location["b1"].add_ship
    assert_equal [" =  =  =  =  = ", " .  1  2  3  4 ", " a  H  M       ", " b             ", " c             ", " d             ", " =  =  =  =  = "]\
    , Drawer.draw_board(board, :opponent)
  end

  def test_it_shows_a_medium_board
    board = Board.new(:medium)
    assert Drawer.draw_board(board, :mine)
  end

  def test_it_draws_large_board
    board = Board.new(:hard)
    assert Drawer.draw_board(board, :mine)
  end
end
