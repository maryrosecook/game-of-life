class Cell
  def initialize(living = false)
    @living = living
  end

  def living?
    @living
  end

  def cache_next_living(neighbours)
    if living_neighbour_count(neighbours) < 2
      @next_living = false
    end
  end

  def set_next_living
    @living = @next_living
  end

  private

  def living_neighbour_count(neighbours)
    neighbours.count(&:living?)
  end
end
