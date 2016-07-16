class Battleship
  def greeting
    puts "Welcome to BATTLESHIP\n\n"
  end

  def menu
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    response = get_menu_choice
    if response == 'p'
      game.start
    elsif response == 'i'
      information
    elsif response == 'q'
      quit
    end
  end

  def get_menu_choice
    gets.chomp.downcase
  end

  def information

    menu
  end

  def quit
    puts farewell
    return
  end
end
