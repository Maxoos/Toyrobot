module ToyRobot
  class Robot

    attr_reader :current_location

    def place x,y,direction
      temp_location = Location.new(x,y,direction)
      if temp_location.valid?
        @current_location = temp_location
      end
    end

    # @return boolean
    def move!
      raise Error::LocationNotSetError unless current_location

      temp_location = @current_location.dup
      case temp_location.direction
        when "NORTH"
          temp_location.y+=1
        when "SOUTH"
          temp_location.y-=1
        when "EAST"
          temp_location.x+=1
        when "WEST"
          temp_location.x-=1
      end

      if temp_location.valid?
        @current_location = temp_location
        true
      else
        false
      end
    end

    def left!
      raise Error::LocationNotSetError unless current_location
      @current_location.direction = Direction.left_of current_location.direction
    end

    def right!
      raise Error::LocationNotSetError unless current_location
      @current_location.direction = Direction.right_of current_location.direction
    end

    def report
      raise Error::LocationNotSetError unless current_location
      @current_location.to_array.join(",")
    end


  end
end
