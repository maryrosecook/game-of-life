class Cell
  def initialize(living = false)
    @living = living
  end

  def living?
    @living
  end

  def cache_next_living(neighbours)
    living_neighbour_count = living_neighbour_count(neighbours)

    if living? && living_neighbour_count < 2
      @next_living = false
    elsif living? && living_neighbour_count.between?(2, 3)
      @next_living = true
    elsif living? && living_neighbour_count > 3
      @next_living = false
    elsif !living? && living_neighbour_count == 3
      @next_living = true
    end
  end

  def set_next_living
    if !@next_living.nil?
      @living = @next_living
    end
  end

  private

  def living_neighbour_count(neighbours)
    neighbours.count(&:living?)
  end
end
