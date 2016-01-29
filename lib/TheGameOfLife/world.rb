module TheGameOfLife
  class World
    attr_accessor :living
    attr_accessor :dying
    attr_accessor :scheduled_cell_positions

    def initialize
      big_bang!
    end

    def self.run
      loop do
        self.new.iterate!
      end
    end

    def iterate!
      mark_dead!

      bring_out_yer_dead!

      let_the_babies_rain!

      reset_dat_world!
    end

    def mark_dead!
      living.each do |cell|
        judgement!(cell)
      end
    end

    private

    def judgement!(cell)
      neighbor_count = 0

      possible_neighbors = find_possible_neighbors(cell.position)

      living.each do |c|
        neighbor_count += 1 if possible_neighbors.include?(c.position)
      end

      if neighbor_count < 2
        cell.sentence! # loneliness
      elsif neighbor_count > 3
        cell.sentence! # overpopulation
      end

      schedule_spawn!(possible_neighbors)
    end

    def schedule_spawn!(possible_neighbors)
      possible_neighbors.each do |neighbor|
        neighbor_count = 0

        living.each do |c|
          neighbor_count += 1 if find_possible_neighbors(neighbor).include?(c.position)
        end

        if neighbor_count === 3
          @scheduled_cell_positions << neighbor
        end
      end
    end

    def let_the_babies_rain!
      @scheduled_cell_positions.each do |position|
        @living << Cell.new(*position)
      end
    end

    def bring_out_yer_dead!
      @living.reject! { |c| c.state == :dying }
    end

    def big_bang!
      @living = []
      @dying = []
      @scheduled_cell_positions = Set.new

      @living.push(Cell.new(3,2), Cell.new(3,3), Cell.new(3,4))
    end

    def find_possible_neighbors(position)
      x = position.first
      y = position.last

      top = [x, y + 1]
      right = [x + 1, y]
      bottom = [x, y - 1]
      left = [x - 1, y]
      diagonal_top_right = [top.first + 1, top.last]
      diagonal_top_left = [top.first - 1, top.last]
      diagonal_bottom_right = [bottom.first + 1, bottom.last]
      diagonal_bottom_left = [bottom.first - 1, bottom.last]

      [
        top,
        right,
        bottom,
        left,
        diagonal_bottom_left,
        diagonal_top_left,
        diagonal_bottom_right,
        diagonal_top_right
      ]
    end

    def reset_dat_world!
      scheduled_cell_positions = Set.new
    end
  end
end
