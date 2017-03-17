module StringOutput
  def self.to_string(board)
    board.cell_states_by_line.map do |cell_states|
      cell_strings = cell_states.map(&method(:cell_state_to_string))
      "#{cell_strings.join}\n"
    end.join
  end

  private

  def self.cell_state_to_string(cell_state)
    cell_state ? "O" : " "
  end
end
