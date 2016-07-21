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
  def self.draw_the_rows(board, size)
    (1..size).map do |row|
      row_char = ("a".ord - 1 + row).chr
      [row_char.center(3)] + (1 .. size).map do |column|
        # binding.pry
        state = board.check_location("#{row_char}#{column}")
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
    end
  end
  def self.draw_my_board(board)
    size = Math.sqrt(board.location.keys.count).to_i
    output_rows = [Drawer.draw_row_of_equals(size)]
    output_rows << Drawer.draw_row_of_numbers(size)
    rows = Drawer.draw_the_rows(board, size)
    rows.each do |row|
      output_rows << row.join("")
    end
    output_rows << Drawer.draw_row_of_equals(size)

  end
end
