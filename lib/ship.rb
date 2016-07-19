class Ship
  attr_reader :size,
              :locations,
              :hits

  def initialize(range, size)
    @locations = range
    @size = size
    @hits = 0
  end

  def hit
    @hits += 1

    size > hits ? "hit" : "sunk"
  end
end
