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
end
