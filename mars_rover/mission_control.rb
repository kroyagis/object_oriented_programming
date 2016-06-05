require_relative 'mars_rover'

class MissionControl
  attr_accessor :rovers

  def initialize
    @rovers = [] # An array to store all the instances of MarsRover class
  end

  # A method which stores all the instances of MarsRover class
  def add_rover(rover)
    if rover.is_a?(MarsRover)
      @rovers << rover
    else
      raise "You must add an rover"
    end
  end

  def take_instruction
    @rovers.each do |rover|
      puts "Enter starting location"
      start_location = gets.chomp
      rover.x = clean_input(start_location)[0].to_i
      rover.y = clean_input(start_location)[1].to_i
      rover.facing = clean_input(start_location)[2]
      puts "Enter instruction"
      instruction = gets.chomp
      rover.read_instruction(instruction)
    end
    @rovers.each do |rover|
      puts "#{rover} has moved to #{rover.x} #{rover.y} #{rover.facing}"
    end
  end

  # A method to remove commas or spaces in user_input,
  # and stores each char in an new_user_input array
  def clean_input(user_input)
    new_user_input = []
    user_input = user_input.gsub(/[\s,]/, "")
    user_input.each_char do |input|
      new_user_input << input
    end
  end

end


mission1 = MissionControl.new

rover1 = MarsRover.new(2,2,'N')
rover2 = MarsRover.new(2,2,'N')

mission1.add_rover(rover1)
mission1.add_rover(rover2)

mission1.take_instruction


# To take things further...
# 0. creates plateu
# 1. check that rovers are within boundary
# 2. collision check
# 3. obstacles on a grid
# 4. show grid with rovers
