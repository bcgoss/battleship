require './test/test_helper'
require './lib/messages'
class MessagesTest < Minitest::Test
  def test_greeting
    assert_equal "Welcome to BATTLESHIP\n\n", Messages.greeting
  end

  def test_menu_message
    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", Messages.menu_message
  end

  def test_information
    assert_equal "who's going to read this?", Messages.information
  end

  def test_farewell
    assert_equal "QUITTER", Messages.farewell
  end

  def test_difficulty
    assert_equal "Choose a difficulty setting! Enter 1 for 'Easy', 2 for 'Medium' or 3 for 'Hard':", Messages.difficulty
  end

  def test_place_ship
    assert_equal "Place a ship! Give me two coordinates which span 3 spots. Coordinates should be formatted like 'a1 a2'", Messages.place_ship(3)
  end

  def test_placement_formatting
    assert_equal "I didn't get that, can you try again?", Messages.placement_formatting
  end

  def test_straight_lines
    assert_equal "a1 and b2 don't form a straight line. Give me two different points in the same row or column", Messages.straight_lines("a1", "b2")
  end

  def test_wrong_length
    assert_equal "The ship takes up 2 spots. Try again, use 2 spots, no more, no less.", Messages.wrong_length(2)
  end

  def test_spot_occupied
    assert_equal "This area is blocked by another ship! Try again!", Messages.spot_occupied
  end

  def test_your_move
    assert_equal "It's your move! Give me a target, something like 'a1'", Messages.ask_for_guess
  end

  def test_hit
    assert_equal "There's a ship at a1! It is sunk", Messages.hit("a1","sunk")
  end
end
