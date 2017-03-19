module StringOutput
  def self.to_string(board)
    board
      .cell_states_by_line
      .map(&method(:line_to_string))
      .join
  end

  private

  def self.line_to_string(cell_states)
    cell_strings = cell_states
                   .map(&method(:cell_state_to_string))
                   .join
    "#{cell_strings}\n"
  end

  def self.cell_state_to_string(cell_state)
    cell_state ? "O" : " "
  end
end
