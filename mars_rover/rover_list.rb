require_relative 'mars_rover'

class Rover_list
  attr_accessor :rovers

  def initialize
    @rovers = []
  end

  def add_rover(rover)
    if rover.is_a?(Mars_rover)
      @rovers << rover
    else
      raise "You must add an rover"
    end
  end

end
