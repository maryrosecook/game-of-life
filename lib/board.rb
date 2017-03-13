class Board
  def initialize(live_cell_indices=[], cell_class=Cell)
    @cells = [cell_class.new]
  end

  def cell_states
    @cells.map(&:on?)
  end
end
