class Location
  attr_reader :state
  def initialize
    @state = "empty"
  end

  def add_ship
    @state = "ship"
  end
end
