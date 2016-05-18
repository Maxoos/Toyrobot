module ToyRobot
  class Direction

    # NOTE: ORDER IS IMPORTANT ** DO NOT CHANGE
    # CLOCKWISE ORDER
    FACES = %w[NORTH EAST SOUTH WEST]

    # @param String
    # @return Boolean
    def self.valid_direction? direction
      FACES.include? direction
    end

    # Finds the direction on the left
    # @param String
    # @return String
    def self.left_of direction
      raise Error::DirectionError unless valid_direction? direction
      # index = [0,FACES.find_index(direction)-1].max
      FACES[FACES.find_index(direction)-1] || FACES.last
    end

    # Finds the direction on the right
    # @param String
    # @return String
    def self.right_of direction
      raise Error::DirectionError unless valid_direction? direction
      # index = [0,FACES.find_index(direction)-1].max
      FACES[FACES.find_index(direction)+1] || FACES.first
    end

  end
end
