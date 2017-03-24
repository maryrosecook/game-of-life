class Board
  SIZE = 3
  NEIGHBOUR_OFFSETS = [[-1, -1], [0, -1], [1, -1],
                       [-1, 0], [1, 0],
                       [-1, 1], [0, 1], [1, 1]]

  def initialize(living_cell_indices={}, cell_class=Cell)
    @cells = 9.times.map do |i|
      cell_class.new(!!living_cell_indices[i])
    end
  end

  def cell_states_by_line
    lines.map do |line_cells|
      line_cells.map(&:living?)
    end
  end

  def neighbours(cell_index)
    hash_lines = to_h(lines.map(&method(:to_h)))
    row = cell_index / SIZE
    column = cell_index % SIZE

    NEIGHBOUR_OFFSETS.map do |column_offset, row_offset|
      (hash_lines[row + row_offset] || [])[column + column_offset]
    end.compact
  end

  private

  def to_h(array)
    Hash[(0...array.size).zip(array)]
  end

  def lines
    @cells.each_slice(SIZE).to_a
  end
end
