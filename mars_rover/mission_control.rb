require_relative 'mars_rover'

class MissionControl
  attr_accessor :rovers

  def initialize
    @rovers = []
  end

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
      rover.x = clean_input(start_location)[0]
      rover.y = clean_input(start_location)[1]
      rover.facing = clean_input(start_location)[2]
      puts "#{rover}'s starting location #{rover.x} #{rover.y} #{rover.facing}"
      puts "Enter instruction"
      instruction = gets.chomp
      rover.read_instruction(instruction)
    end
  end

  # def test_start
  #   @rovers.each do |rover|
  #     puts "Enter starting location"
  #     start_location = gets.chomp
  #     rover.x = clean_input(start_location)[0]
  #     rover.y = clean_input(start_location)[1]
  #     rover.facing = clean_input(start_location)[2]
  #   end
  # end

  # def test
  #   test_input = gets.chomp
  #   puts "#{clean_input(test_input)}"
  #
  # end

  def clean_input(user_input)
    new_user_input = []
    user_input.each_char do |input|
      if (user_input != ',') && (user_input != ' ')
        begin
          new_user_input << input.to_i
        rescue
          new_user_input << input
        end
      end
    #
    # if (user_input.include? ',') || (user_input.include? ' ')
    #   new_user_input = user_input.split(/\s*,\s*/)
    # else
    #   user_input.each_char do |x|
    #     new_user_input << x.to_i
    #   end
    #   return new_user_input
    # end
      return new_user_input
    end
  end

end
# 1. check that rovers are within boundary
# 2. collision check
# 3. obstacles on a grid
# 4. show grid with rovers

list1 = MissionControl.new
rover1 = MarsRover.new(2,2,'N')
rover2 = MarsRover.new(2,2,'N')
# rover3 = MarsRover.new(2,2,'N')


list1.add_rover(rover1)
list1.add_rover(rover2)
# list1.add_rover(rover3)

list1.take_instruction

puts "#{rover1.x} #{rover1.y} #{rover1.facing}"
puts "#{rover2.x} #{rover2.y} #{rover2.facing}"
# puts "#{rover3.x} #{rover3.y} #{rover3.facing}"
