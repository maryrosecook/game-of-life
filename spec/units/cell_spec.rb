require "cell"

describe Cell do
  describe "instantiation" do
    it "defaults on to false" do
      expect(subject).to_not be_on
    end

    it "sets cell to passed on value" do
      expect(described_class.new(on=true)).to be_on
    end
  end

  describe "#on?" do
    it "returns false if cell not on" do
      expect(subject).to_not be_on
    end

    it "returns true if cell on" do
      expect(described_class.new(on=true)).to be_on
    end
  end

  describe "#duplicate" do
    it "cell that's on returns cell that's on" do
      expect(Cell.new(on=true).duplicate).to be_on
    end

    it "cell that's off returns cell that's off" do
      expect(Cell.new(on=false).duplicate).to_not be_on
    end
  end

  describe "#step" do
    let(:on_cell) { described_class.new(on=true) }
    let(:off_cell) { described_class.new(on=false) }

    it "turns cell off if fewer than two on neighbours" do
      neighbours = [off_cell, off_cell, off_cell, off_cell,
                    off_cell, off_cell, off_cell, off_cell]

      cell = Cell.new(on=true)
      expect(cell).to be_on

      cell.step(neighbours)
      expect(cell).to_not be_on
    end
  end
end
