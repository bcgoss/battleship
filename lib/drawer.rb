module Drawer
  def self.draw_row_of_equals(size)
    row_of_equals = ""
    ( size + 1 ).times do |count|
      row_of_equals += "=".center(3)
    end
    row_of_equals
  end
  def self.draw_row_of_numbers(size)
    ".".center(3) + ( 1 .. size).map do |number|
      number.to_s.center(3)
    end.join
  end

  def self.draw_board(board, owner)
    size = Math.sqrt(board.location.keys.count).to_i
    output_rows = [Drawer.draw_row_of_equals(size)]
    output_rows << Drawer.draw_row_of_numbers(size)
    rows = Drawer.draw_opponent_rows(board, size) if owner == :opponent
    rows = Drawer.draw_my_rows(board, size) if owner == :mine
    rows.each do |row|
      output_rows << row.join("")
    end
    output_rows << Drawer.draw_row_of_equals(size)
  end

  def self.draw_my_rows(board, size)
    (1..size).map do |row|
      row_char = ("a".ord - 1 + row).chr
      [row_char.center(3)] + (1 .. size).map do |column|
        state = board.check_location("#{row_char}#{column}")
        draw_my_location(state)
      end
    end
  end

  def self.draw_opponent_rows(board, size)
    (1..size).map do |row|
      row_char = ("a".ord - 1 + row).chr
      [row_char.center(3)] + (1 .. size).map do |column|
        state = board.check_location("#{row_char}#{column}")
        draw_opponent_location(state)
      end
    end
  end

  def self.draw_my_location(state)
    case
      when state == :hit
        "H".center(3)
      when state == :miss
        "M".center(3)
      when state == :ship
        "S".center(3)
      when state == :empty
        " ".center(3)
      when state == "out of bounds"
        "E".center(3)
    end
  end

  def self.draw_opponent_location(state)
    case
      when state == :hit
        "H".center(3)
      when state == :miss
        "M".center(3)
      when state == :ship
        " ".center(3)
      when state == :empty
        " ".center(3)
      when state == "out of bounds"
        "E".center(3)
    end
  end
end
