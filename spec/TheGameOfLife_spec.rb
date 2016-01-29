require 'spec_helper'

# [ ] Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# [x] Any live cell with two or three live neighbours lives on to the next generation.
# [x] Any live cell with more than three live neighbours dies, as if by over-population.
# [ ] Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

describe TheGameOfLife do
  context "world" do
    subject(:living) {TheGameOfLife::World.new.living}

    it "has 3 living cells" do
      expect(living.length).to eq(3)
    end
  end

  context "#iterate!!" do
    let(:world) { TheGameOfLife::World.new }
    let(:cells) { world.living }
    let(:scheduled_cell_positions) { world.scheduled_cell_positions }

    subject(:iterate!) { world.iterate! }

    it "removes the dying cells" do
      iterate!

      expect(cells.map(&:position)).to include([2,3], [3,3], [4,3])
    end
  end
end
