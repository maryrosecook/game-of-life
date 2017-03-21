class Cell
  def initialize(on = false)
    @on = on
  end

  def on?
    @on
  end

  def duplicate
    self.class.new(on=on?)
  end

  def step(neighbours)
    if on_neighbour_count(neighbours) < 2
      @on = false
    end
  end

  private

  def on_neighbour_count(neighbours)
    neighbours.count(&:on?)
  end
end
