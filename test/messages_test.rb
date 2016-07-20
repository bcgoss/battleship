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
end
