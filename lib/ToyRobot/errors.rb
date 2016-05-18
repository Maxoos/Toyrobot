module Error
  class DirectionError < ArgumentError
    def message
      "Direction not valid"
    end
  end
  class LocationError < ArgumentError
    def message
      "Location not valid"
    end
  end
  class LocationNotSetError < ArgumentError
    def message
      "Location not set, please use the PLACE command"
    end
  end
  class CommandError < ArgumentError
    def message
      "Invalid Command"
    end
  end
end
