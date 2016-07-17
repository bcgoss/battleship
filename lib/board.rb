require './lib/location'
class Board
  attr_reader :size
  def initialize(difficulty = "easy")
    @location= Hash.new
    @size = case difficulty
    when "easy" then 4
    when "medium" then 8
    when "hard" then 12
    end
    set_board(size)
  end

  def check_location(target)
    target_location = @location[target.downcase]
    target_location == nil ? "out of bounds" : target_location.state
  end
  def set_location(target, state)
    if state == "hit"
      @location[target].record_hit
    elsif state == "miss"
      @location[target].record_miss
    end
  end

  def set_board(size)
    letter = "a"
    number = "1"
    size.times do
      size.times do
        @location["#{letter}#{number}"] = Location.new
        number = number.next
      end
      number = "1"
      letter = letter.next
    end
  end
end
