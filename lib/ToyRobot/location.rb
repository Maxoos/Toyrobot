module ToyRobot
  class Location
    attr_accessor :x, :y, :direction

    def initialize x, y, direction
      @x = x
      @y = y
      @direction = direction
    end

    def valid?
      return false unless Direction.valid_direction?(direction)
      return false unless Table.valid_location?(x,y)
      return true
    end

    def to_array
      [x,y,direction]
    end

  end
end

