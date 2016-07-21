require './lib/player'

class HumanPlayer < Player
  def place_ship(size)
    placed = false
    until placed == true
      puts Messages.place_ship(size)
      input = gets.chomp.split(" ")
      if check_placement_input(input) == true
        placed = super(input[0], input[1], size)
      else
        puts check_placement_input(input)
      end
      puts placed unless placed == true
    end
  end

  def check_placement_input(input)
    return Messages.placement_formatting unless input.count == 2 &&
    (input[0].length == 2 || input[0].length == 3) &&
    (input[1].length == 2 || input[1].length == 3)

    true
  end
end
