require "board"

describe Board do
  let (:cell) { double(:cell, on?: true) }
  let (:cell_class) { double(:cell_class, new: cell) }

  it "is instantiated" do
    expect { Board.new(cell_class)}.to_not raise_error
  end

  describe "#cell_states" do
    it "returns on/off for all the cells on the board" do
      expect(Board.new(cell_class).cell_states[0]).to eq(false)
    end
  end
end
