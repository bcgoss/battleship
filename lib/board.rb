require './lib/location'
require './lib/messages'
class Board
  attr_reader :size,
              :location

  def initialize(difficulty = :easy)
    @size = case difficulty
    when :easy then 4
    when :medium then 8
    when :hard then 12
    end
    # binding.pry
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
    if state == :hit
      @location[target].record_hit
    elsif state == :miss
      @location[target].record_miss
    end
  end

  def get_row_index(coordinates)
    coordinates.chars.first
  end
  def get_column_index(coordinates)
    coordinates.chars[1..-1].join #range from index 1, to last index. a12 => 12
  end

  def get_location_range(starting, ending)
    if row_or_column(starting, ending) == :row
      get_range_from_row(starting, ending)
    elsif row_or_column(starting, ending) == :column
      get_range_from_column(starting, ending)
    end
  end

  def row_or_column(starting, ending)
    if get_row_index(starting) == get_row_index(ending) && \
      get_column_index(starting) != get_column_index(ending)
      return :row
    elsif get_row_index(starting) != get_row_index(ending) && \
      get_column_index(starting) == get_column_index(ending)
      return :column
    else
      return :neither
    end
  end

  #the following are similar, consider refactoring / extracting
  def get_range_from_row(starting, ending)
    row = get_row_index(starting)
    column_limits = [get_column_index(starting).to_i]
    column_limits << get_column_index(ending).to_i

    range = (column_limits.min .. column_limits.max).map do |column|
      coordinate_builder(row,column)
    end
    return range
  end

  def get_range_from_column(starting, ending)
    column = get_column_index(starting)
    row_limits = [get_row_index(starting).ord]
    row_limits << get_row_index(ending).ord

    range = (row_limits.min .. row_limits.max).map do |row|
      coordinate_builder(row.chr, column)
    end
    return range
  end

  def distance(starting, ending)
    range = get_location_range(starting, ending)
    range.count
  end

  def validate_ship_placement(starting, ending, ship_size)
    return Messages.straight_lines(starting, ending) if row_or_column(starting, ending) == :neither
    return Messages.wrong_length(ship_size) if wrong_length?(starting, ending, ship_size)
    range = get_location_range(starting, ending)
    return Messages.spot_occupied if occupied?(range)
    true
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

  def guess_location(guess)
    if check_location(guess) == "out of bounds"
      return "out of bounds"
    end
    if @location[guess].ship?
      return set_location(guess, :hit)
    elsif @location[guess].empty?
      return set_location(guess, :miss)
    else
      return check_location(guess)
    end
  end
end
