module TheGameOfLife
  class Cell
    attr_accessor :position
    attr_accessor :state

    def initialize(x, y)
      @state = :alive
      @position = [x, y]
    end

    def sentence!
      @state = :dying
    end
  end
end
