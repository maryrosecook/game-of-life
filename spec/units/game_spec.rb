require "game"

describe Game do
  describe "#cell_states_by_line" do
    let(:living_cell) { double(:living_cell, living?: true) }
    let(:dead_cell) { double(:head_cell, living?: false) }
    let(:grid) { double(:grid, lines: [[living_cell], [dead_cell]]) }

    it "returns living state of cells" do
      cell_states_by_line = described_class.new(grid).cell_states_by_line
      expect(cell_states_by_line).to eq([[true], [false]])
    end
  end

  describe "#step" do
    let(:cell_1) { double(:cell_1) }
    let(:cell_2) { double(:cell_2) }
    let(:neighbours) { double(:neighbours) }
    let(:grid) { double(:grid,
                        lines: [[cell_1], [cell_2]],
                        neighbours: neighbours) }

    it "tells every cell to cache_next_living" do
      game = described_class.new(grid)
      expect(cell_1).to receive(:cache_next_living).with(neighbours)
      expect(cell_2).to receive(:cache_next_living).with(neighbours)

      expect(cell_1).to receive(:set_next_living)
      expect(cell_2).to receive(:set_next_living)

      game.step
    end
  end
end
