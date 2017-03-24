class Game
  def initialize(grid)
    @grid = grid
  end

  def cell_states_by_line
    @grid.lines.map do |line_cells|
      line_cells.map(&:living?)
    end
  end

  def step
    @grid.lines.flatten.each_with_index do |cell, index|
      cell.cache_next_living(@grid.neighbours(index))
    end

    @grid.lines.flatten.map(&:set_next_living)
  end
end
