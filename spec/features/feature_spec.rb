describe "Features" do
  it "shows a board" do
    expect(StringOutput.to_string(Board.new)).to eq("   \n   \n   \n")
  end

  it "creates a board with some cells living" do
    cell_states = Board.new({0 => true, 4 => true}).cell_states
    expect(cell_states[0]).to be(true)
    expect(cell_states[1]).to be(false)
    expect(cell_states[4]).to be(true)
  end
end
