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
  def test_your_move
    assert_equal "It's your move! Give me a target, something like 'a1'", Messages.ask_for_guess
  end

  def test_hit
    assert_equal "There's a ship at a1! It is sunk", Messages.hit("a1","sunk")
  end
end
