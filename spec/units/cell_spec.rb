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

  describe "#cache_next_living" do
    let(:living_cell) { described_class.new(living=true) }
    let(:off_cell) { described_class.new(living=false) }

    it "doesn't change external state" do
      neighbours = [off_cell, off_cell, off_cell, off_cell,
                    off_cell, off_cell, off_cell, off_cell]

      cell = Cell.new(living=true)
      expect(cell).to be_living

      cell.cache_next_living(neighbours)
      expect(cell).to be_living
    end
  end

  describe "#cache_next_living and #set_next_living" do
    let(:living_cell) { described_class.new(living=true) }
    let(:off_cell) { described_class.new(living=false) }

    it "caches next living state and fixes it" do
      neighbours = [off_cell, off_cell, off_cell, off_cell,
                    off_cell, off_cell, off_cell, off_cell]

      cell = Cell.new(living=true)
      expect(cell).to be_living

      cell.cache_next_living(neighbours)
      cell.set_next_living
      expect(cell).to_not be_living
    end
  end
end
