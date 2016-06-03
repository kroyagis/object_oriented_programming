class Mars_rover
  attr_accessor :x, :y, :facing



  def initialize(x, y, facing)
    @x = x
    @y = y
    @facing = facing
    @ways = ['N', 'E', 'S', 'W']
    @hashways = Hash[@ways.map.with_index.to_a]
  end

  def check
    puts @hashways
  end

  def read_instruction(instruction)

    # puts "Enter instruction"
    # instructions = gets.chomp
    instruction.each_char do |instruction|
      if instruction == 'L' || instruction == 'R'
        turn(instruction)
      elsif instruction == 'M'
        move
      end
    end
  end

  def move
    if @hashways[@facing] == 0 # when facing North
      @y += 1
    end
    if @hashways[@facing] == 1 # when facing East
      @x += 1
    end
    if @hashways[@facing] == 2 # when facing South
      @y -= 1
    end
    if @hashways[@facing] == 3 # when facing West
      @x -= 1
    end
  end

  def turn(direction)
    if direction == 'R'
      if @hashways[@facing] == 3
        return @facing = @ways[0]
      end
      return @facing = @ways[@hashways[@facing] + 1]
    elsif direction == 'L'
      if @hashways[@facing] == 0
        return @facing = @ways[3]
      end
      return @facing = @ways[@hashways[@facing] - 1]
    end
  end
end

# def clean_input(user_input)
#   if user_input.include? ','
#     new_user_input = user_input.split(',')
#   elsif user_input.include? ' '
#     new_user_input = user_input.split(' ')
#   end
# end
# rover_list = []
# puts "Enter the name of the rover"
# name_rover = gets.chomp
# puts "Enter the coordinates"
# coordinate_rover = gets.chomp
