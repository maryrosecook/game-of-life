require "cell"

describe Cell do
  describe "instantiation" do
    it "defaults living to false" do
      expect(subject).to_not be_living
    end

    it "sets cell to passed living value" do
      expect(described_class.new(living=true)).to be_living
    end
  end

  describe "#living?" do
    it "returns false if cell not living" do
      expect(subject).to_not be_living
    end

    it "returns true if cell living" do
      expect(described_class.new(living=true)).to be_living
    end
  end

  describe "#duplicate" do
    it "cell that's living returns cell that's living" do
      expect(Cell.new(living=true).duplicate).to be_living
    end

    it "cell that's off returns cell that's off" do
      expect(Cell.new(living=false).duplicate).to_not be_living
    end
  end

  describe "#step" do
    let(:living_cell) { described_class.new(living=true) }
    let(:off_cell) { described_class.new(living=false) }

    it "turns cell off if fewer than two living neighbours" do
      neighbours = [off_cell, off_cell, off_cell, off_cell,
                    off_cell, off_cell, off_cell, off_cell]

      cell = Cell.new(living=true)
      expect(cell).to be_living

      cell.step(neighbours)
      expect(cell).to_not be_living
    end
  end
end
