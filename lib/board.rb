class Board
  SIZE = 3

  def initialize(on_cell_indices={}, cell_class=Cell)
    @cells = 9.times.map do |i|
      cell_class.new(!!on_cell_indices[i])
    end
  end

  def cell_states
    @cells.map(&:on?)
  end
end
