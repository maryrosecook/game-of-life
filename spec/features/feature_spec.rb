describe "Features" do
  it "shows a board" do
    expect(StringOutput.to_string(Board.new)).to eq(" \n")
  end

  xit "creates a board with some cells living" do
    cells = Board.new([0, 4, 8]).cells
    expect(cells[0]).to be_on
  end
end
