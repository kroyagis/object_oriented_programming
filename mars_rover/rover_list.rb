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

  def mission_control
    @rovers.each do |rover|

      puts "Enter instruction"
      instruction = gets.chomp
      rover.read_instruction(instruction)
    end
  end

end

list1 = Rover_list.new
rover1 = Mars_rover.new(2,2,'N')
rover2 = Mars_rover.new(2,2,'N')
rover3 = Mars_rover.new(2,2,'N')


list1.add_rover(rover1)
list1.add_rover(rover2)
list1.add_rover(rover3)

list1.mission_control

puts "#{rover1.x} #{rover1.y} #{rover1.facing}"
puts "#{rover2.x} #{rover2.y} #{rover2.facing}"
puts "#{rover3.x} #{rover3.y} #{rover3.facing}"
#
# rover1 = Mars_rover.new(2,2,'N')
# list1 = Rover_list.new
#
# list1.add_rover(rover1)
