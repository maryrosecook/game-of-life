require "string_output"

describe StringOutput do
  let(:board) { double(:board, cell_states: [true] ) }

  it "takes board with 1 on cell and returns O" do
    expect(StringOutput.to_string(board)).to match("O")
  end

  it "takes board with 1 on cell and returns line with a O" do
    expect(StringOutput.to_string(board)).to match("\n$")
  end
end
