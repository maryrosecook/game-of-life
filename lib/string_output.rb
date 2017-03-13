module StringOutput
  def self.to_string(board)
    "#{cell_state_to_string(board.cell_states[0])}\n"
  end

  private

  def self.cell_state_to_string(cell_state)
    cell_state ? "O" : " "
  end
end
