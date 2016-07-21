require './lib/player'
class AIPlayer < Player
  def place_ship(size, other_board)
    placed = false
    until placed == true
      input = generate_ship_placement(size, other_board)
      response = super(input[0], input[1], size, other_board)
      if response.class == Board
        return response
      else
        placed == false
      end
    end
  end
  def generate_ship_placement(size, other_board)
    # valid_starting_points = []
    # other_board.location.each_pair do |coordinates, location|
    #   valid_starting_points << coordinates if location.state == :empty
    # end
    # starting_point = valid_starting_points.sample
    # direction = [:row, :column].sample
    # if direction == :row
    #    ending_point = starting_point.chars.first + (starting_point.chars[1..-1].join.to_i + size - 1).to_s
    # end
    # if direction == :column
    #   ending_point = (starting_point.chars.first.ord + size - 1).chr + starting_point.chars[1..-1].join
    # end
    #
    # [starting_point, ending_point]

    return ["a1","a2"] if size == 2
    return ["b1", "b3"] if size == 3
    return ["c1", "c4"] if size == 4
    return ["d1", "d5"] if size ==5
  end

  def generate_a_target
    @board.location.keys.sample
  end
end
