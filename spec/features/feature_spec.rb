describe "Features" do
  it "shows a board" do
    expect(StringOutput.to_string(Game.new(Grid.new)))
      .to eq("   \n   \n   \n")
  end

  it "creates a board with some cells living" do
    cell_states_by_line =
      Game.new(Grid.new({0 => true, 4 => true})).cell_states_by_line
    expect(cell_states_by_line[0][0]).to be(true)
    expect(cell_states_by_line[0][1]).to be(false)
    expect(cell_states_by_line[1][1]).to be(true)
  end

  it "steps a board so cells with fewer than 2 neighbours die" do
    board = Game.new(Grid.new({ 0 => true }))
    expect(board.cell_states_by_line[0][0]).to be(true)

    board.step
    expect(board.cell_states_by_line[0][0]).to be(false)
  end
end
