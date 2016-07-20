require './lib/messages'
require './lib/game'
class Battleship
  def self.menu
    puts Messages.menu_message
    response = gets.chomp.downcase
    if response == 'p'
      game = Game.new
      game.start
    elsif response == 'i'
      information
    elsif response == 'q'
      quit
    end
  response
  end

  def information
    puts Messages.information
  end

  def quit
    puts Messages.farewell
  end
end

puts Messages.greeting
input = nil
until input == 'q'
  input = Battleship.menu
end
