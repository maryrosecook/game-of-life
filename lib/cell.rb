class Cell
  def initialize(living = false)
    @living = living
  end

  def living?
    @living
  end

  def duplicate
    self.class.new(living=living?)
  end

  def step(neighbours)
    if living_neighbour_count(neighbours) < 2
      @living = false
    end
  end

  private

  def living_neighbour_count(neighbours)
    neighbours.count(&:living?)
  end
end
