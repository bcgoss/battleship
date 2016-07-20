require './lib/location'
class Board
  attr_reader :size,
              :location
  def initialize(difficulty = "easy")
    @size = case difficulty
    when "easy" then 4
    when "medium" then 8
    when "hard" then 12
    end
    @location = set_board(size)
  end

  def set_board(size)
    location = Hash.new
    letter = "a"
    number = "1"
    size.times do
      size.times do
        location[coordinate_builder(letter,number)] = Location.new
        number = number.next
      end
      number = "1"
      letter = letter.next
    end
    location
  end

  def coordinate_builder(row, column)
    "#{row}#{column}"
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

  def get_row_index(coordinates)
    coordinates.chars.first
  end
  def get_column_index(coordinates)
    coordinates.chars[1..-1].join #range from index 1, to last index. a12 => 12
  end

  def get_coordinates(coordinates)
    result =  coordinates.match(/([a-z])(\d+)/i)
    fail(ArgumentError, "#{coordinates} don't match pattern 'a12'") if result.length != 2
    {row: result[0], column: result[1]}
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

  #the following are similar, consider refactoring / extracting
  def get_range_from_row(starting, ending)
    row = get_row_index(starting)
    column_limits = [get_column_index(starting).to_i]
    column_limits << get_column_index(ending).to_i

    if column_limits[0] == column_limits[1]
      return starting
    end

    range = (column_limits.min .. column_limits.max).map do |column|
      coordinate_builder(row,column)
    end
    return range
  end

  def get_range_from_column(starting, ending)
    column = get_column_index(starting)
    row_limits = [get_row_index(starting).ord]
    row_limits << get_row_index(ending).ord

    if row_limits[1] == row_limits[0]
      return starting
    end

    range = (row_limits.min .. row_limits.max).map do |row|
      coordinate_builder((row).chr, column)
    end
    return range
  end

  def distance(starting, ending)
    range = get_location_range(starting, ending)
    range.count
  end

  def validate_ship_placement(starting, ending, ship_size)
    range = get_location_range(starting, ending)
    valid = true
    valid = false if row_or_column(starting, ending) == "neither"
    valid = false if wrong_length?(starting, ending, ship_size)
    valid = false if occupied?(range)
    valid
  end

  def wrong_length?(starting, ending, ship_size)
    distance(starting, ending) != ship_size
  end

  def occupied?(range)
    range.each do |target|
      if @location[target].ship?
        return true
      end
    end
    false
  end
end
