require "string_output"

describe StringOutput do
  let(:board) { double(:board,
                       cell_states_by_line: [[true, true, true],
                                             [true, true, true],
                                             [true, true, true]] ) }

  it "takes board with all on cells and returns 3 rows of Os" do
    expect(StringOutput.to_string(board)).to eq("OOO\nOOO\nOOO\n")
  end
end
