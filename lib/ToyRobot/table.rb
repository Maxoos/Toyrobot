module ToyRobot
  class Table

    X = 0
    WIDTH = 4

    Y = 0
    HEIGHT = 4

    # accepts a location object and validates its coordinates
    #
    # @param _x,_y
    # @return boolean
    def self.valid_location? _x,_y
       _x.between?(X,WIDTH) and _y.between?(Y,HEIGHT)
    end

  end
end
