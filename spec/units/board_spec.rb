require "board"

describe Board do
  describe "initialisation of cell_states" do
    let (:cell_class) { double(:cell_class) }

    it "creates 9 initial cells" do
      expect(cell_class).to receive(:new).exactly(9).times
      described_class.new({}, cell_class)
    end

    it "sets cell_states to on for passed indices" do
      expect(cell_class).to receive(:new).exactly(1).times.with(true)
      expect(cell_class).to receive(:new).exactly(8).times.with(false)

      described_class.new({0 => true}, cell_class)
    end
  end
end
