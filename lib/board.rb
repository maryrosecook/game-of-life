class Board
  SIZE = 3

  def initialize(on_cell_indices={}, cell_class=Cell)
    @cells = 9.times.map do |i|
      cell_class.new(!!on_cell_indices[i])
    end
  end

  def cell_states_by_line
    @cells.each_slice(SIZE).to_a.map do |line_cells|
      line_cells.map(&:on?)
    end
  end
end
