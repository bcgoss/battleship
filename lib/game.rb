class Game
  attr_accessor :won
  def self.start

    setup
    until won?
      won = human_player_turn
      won =computer_player_turn unless won?
    end
    #tear_down
  end
  def setup

  end
  def human_player_turn
    display_my_guesses
    ask_for_guess
    display_my_guesses
    wait_for_enter
  end
  def computer_player_turn
    ai_player_guess
    display_opponent_guesses
    wait_for_enter
  end
  def won?
    won
  end
end
