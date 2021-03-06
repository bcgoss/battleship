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
      self.quit
    end
  response
  end

  def self.information
    puts Messages.information
  end

  def self.quit
    puts Messages.farewell
  end
end
system("clear")
puts Messages.greeting
input = nil
until input == 'q'
  input = Battleship.menu
end
