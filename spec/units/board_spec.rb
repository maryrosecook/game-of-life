require "board"

describe Board do
  describe "initialisation of cells" do
    let (:cell_class) { double(:cell_class) }

    it "creates 9 initial cells" do
      expect(cell_class).to receive(:new).exactly(9).times
      described_class.new({}, cell_class)
    end

    it "sets cell_states to living for passed indices" do
      expect(cell_class).to receive(:new).exactly(1).times.with(true)
      expect(cell_class).to receive(:new).exactly(8).times.with(false)

      described_class.new({0 => true}, cell_class)
    end
  end

  describe "cell_states" do
    let (:cell) { double(:cell, living?: false) }
    let (:cell_class) { double(:cell_class, new: cell) }

    it "returns living state of cells" do
      cell_states_by_line =
        described_class.new({}, cell_class).cell_states_by_line
      expect(cell_states_by_line)
        .to eq([[false, false, false],
                [false, false, false],
                [false, false, false]])
    end
  end
end
