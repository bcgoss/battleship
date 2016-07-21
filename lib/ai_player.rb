require './lib/player'
class AIPlayer < Player
  def place_ship(size)
    placed = false
    until placed == true
      input = generate_ship_placement(size)
      placed = super(input[0], input[1], size)
    end
  end
  def generate_ship_placement(size)
    return ["a1","a2"] if size == 2
    return ["b1", "b3"] if size == 3
    return ["c1", "c4"] if size == 4
    return ["d1", "d5"] if size ==5
  end

  def guess_location
    super(generate_a_target)
  end

  def generate_a_target
    @board.location.keys.sample
  end
end
