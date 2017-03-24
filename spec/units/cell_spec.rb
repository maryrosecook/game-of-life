require "cell"

describe Cell do
  let(:living_cell) { described_class.new(living=true) }
  let(:dead_cell) { described_class.new(living=false) }

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
    it "doesn't change external state" do
      neighbours = [dead_cell, dead_cell, dead_cell, dead_cell,
                    dead_cell, dead_cell, dead_cell, dead_cell]

      cell = Cell.new(living=true)
      expect(cell).to be_living

      cell.cache_next_living(neighbours)
      expect(cell).to be_living
    end
  end

  describe "#cache_next_living and #set_next_living" do
    it "caches next living state and fixes it" do
      neighbours = [dead_cell, dead_cell, dead_cell, dead_cell,
                    dead_cell, dead_cell, dead_cell, dead_cell]

      cell = Cell.new(living=true)
      expect(cell).to be_living

      cell.cache_next_living(neighbours)
      cell.set_next_living
      expect(cell).to_not be_living
    end
  end

  describe "rules" do
    it "dies if living and has < 2 living neighbours" do
      neighbours = [dead_cell, dead_cell, dead_cell, dead_cell,
                    dead_cell, dead_cell, dead_cell, dead_cell]

      cell = Cell.new(living=true)
      cell.cache_next_living(neighbours)
      cell.set_next_living
      expect(cell).to_not be_living
    end

    it "lives if living and has 2 living neighbours" do
      neighbours = [living_cell, living_cell, dead_cell, dead_cell,
                    dead_cell, dead_cell, dead_cell, dead_cell]

      cell = Cell.new(living=true)
      cell.cache_next_living(neighbours)
      cell.set_next_living
      expect(cell).to be_living
    end

    it "lives if living and has 3 living neighbours" do
      neighbours = [living_cell, living_cell, living_cell, dead_cell,
                    dead_cell, dead_cell, dead_cell, dead_cell]

      cell = Cell.new(living=true)
      cell.cache_next_living(neighbours)
      cell.set_next_living
      expect(cell).to be_living
    end

    it "die if living and has > 3 living neighbours" do
      neighbours = [living_cell, living_cell, living_cell, living_cell,
                    dead_cell, dead_cell, dead_cell, dead_cell]

      cell = Cell.new(living=true)
      cell.cache_next_living(neighbours)
      cell.set_next_living
      expect(cell).to_not be_living
    end

    it "comes alive if dead and has 3 living neighbours" do
      neighbours = [living_cell, living_cell, living_cell, dead_cell,
                    dead_cell, dead_cell, dead_cell, dead_cell]

      cell = Cell.new(living=false)
      cell.cache_next_living(neighbours)
      cell.set_next_living
      expect(cell).to be_living
    end
  end
end
