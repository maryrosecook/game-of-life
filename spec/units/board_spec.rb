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

  describe "#cell_states_by_line" do
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

  describe "#neighbours" do
    let(:zero) { double(:zero_cell) }
    let(:one) { double(:one_cell) }
    let(:two) { double(:two_cell) }
    let(:three) { double(:three_cell) }
    let(:four) { double(:four_cell) }
    let(:five) { double(:five_cell) }
    let(:six) { double(:six_cell) }
    let(:seven) { double(:seven_cell) }
    let(:eight) { double(:eight_cell) }
    let(:cell_class) { double(:cell_class) }

    before(:each) do
      allow(cell_class)
        .to receive(:new).and_return(zero, one, two, three, four,
                                     five, six, seven, eight)
      @board = described_class.new({}, cell_class)
    end

    it "returns neighbours for top left cell" do
      # xn2
      # nn5
      # 678
      expect(@board.neighbours(0))
        .to eq([one, three, four])
    end

    it "returns neighbours for top middle cell" do
      # nxn
      # nnn
      # 678
      expect(@board.neighbours(1))
        .to eq([zero, two, three, four, five])
    end

    it "returns neighbours for top right cell" do
      # 0nx
      # 3nn
      # 678
      expect(@board.neighbours(2))
        .to eq([one, four, five])
    end

    it "returns neighbours for left middle cell" do
      # nn2
      # xn5
      # nn8
      expect(@board.neighbours(3))
        .to eq([zero, one, four, six, seven])
    end

    it "returns neighbours for middle middle cell" do
      # nnn
      # nxn
      # nnn
      expect(@board.neighbours(4))
        .to eq([zero, one, two, three, five, six, seven, eight])
    end

    it "returns neighbours for middle right cell" do
      # 0nn
      # 3nx
      # 6nn
      expect(@board.neighbours(5))
        .to eq([one, two, four, seven, eight])
    end

    it "returns neighbours for bottom left cell" do
      # 012
      # nn5
      # xn8
      expect(@board.neighbours(6))
        .to eq([three, four, seven])
    end

    it "returns neighbours for bottom left cell" do
      # 012
      # nnn
      # nxn
      expect(@board.neighbours(7))
        .to eq([three, four, five, six, eight])
    end

    it "returns neighbours for bottom left cell" do
      # 012
      # 3nn
      # 6nx
      expect(@board.neighbours(8))
        .to eq([four, five, seven])
    end
  end
end
