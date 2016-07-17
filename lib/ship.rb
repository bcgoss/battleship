class Ship
  attr_reader :size,
              :locations,
              :hits

  def initialize(starting, ending)
    @locations = assign_locations(starting, ending)
    @size = locations.count
    @hits = 0
  end

  def assign_locations(starting, ending)
    return [starting, ending]
  end

  def hit
    @hits += 1

    size > hits ? hits : "sunk"
  end
end
