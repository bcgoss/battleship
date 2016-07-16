class Battleship
  def greeting
    puts "Welcome to BATTLESHIP\n\n"
  end

  def menu
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    response = get_menu_choice
  end

  def get_menu_choice
    gets.chomp.downcase
  end
end
