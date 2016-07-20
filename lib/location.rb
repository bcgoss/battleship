class Location
  attr_reader :state
  def initialize
    @state = :empty
  end

  def add_ship
    @state = :ship
  end

  def ship?
    state == :ship
  end

  def empty?
    state == :empty
  end

  def record_hit
    @state = :hit
  end

  def record_miss
    @state = :miss
  end
end
