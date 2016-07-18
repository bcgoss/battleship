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

  def get_row_index(location)
    location.chars.first
  end
  def get_column_index(location)
    location.chars[1..-1].join #range from index 1, to last index
  end

  def get_location_range(starting, ending)
    if row_or_column(starting, ending) == "row"
      get_range_from_row(starting, ending)
    elsif row_or_column(starting, ending) == "column"
      get_range_from_column(starting, ending)
    end
  end

  def row_or_column(starting, ending)
    if get_row_index(starting) == get_row_index(ending) && \
      get_column_index(starting) != get_column_index(ending)
      return "row"
    elsif get_row_index(starting) != get_row_index(ending) && \
      get_column_index(starting) == get_column_index(ending)
      return "column"
    else
      return "neither"
    end
  end

  def get_range_from_row(starting, ending)
    row = get_row_index(starting)
    starting_column = get_column_index(starting).to_i
    ending_column = get_column_index(ending).to_i

    if ending_column - starting_column > 0
      range = (starting_column..ending_column).map do |column|
        "#{row}#{column}"
      end
    elsif starting_column - ending_column > 0
      range = (ending_column..starting_column).map do |column|
        "#{row}#{column}"
      end
    else
      return [starting]
    end
    return range
  end

  def distance(starting, ending)
    range = get_location_range(starting, ending)
    range.count
  end
end
