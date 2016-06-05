class MarsRover
  attr_accessor :x, :y, :facing

  DIRECTION = ['N', 'E', 'S', 'W']
  DIRECTION_HASH = Hash[DIRECTION.map.with_index.to_a]

  def initialize(x, y, facing)
    @x = x
    @y = y
    @facing = facing
  end

  def read_instruction(instruction)
    instruction.each_char do |instruction|
      if instruction == 'L' || instruction == 'R'
        turn(instruction)
      elsif instruction == 'M'
        move
      end
    end
  end

  def move
    if DIRECTION_HASH[@facing] == 0 # when facing North
      @y += 1
    end
    if DIRECTION_HASH[@facing] == 1 # when facing East
      @x += 1
    end
    if DIRECTION_HASH[@facing] == 2 # when facing South
      @y -= 1
    end
    if DIRECTION_HASH[@facing] == 3 # when facing West
      @x -= 1
    end
  end

  def turn(direction)
    if direction == 'R'
      if DIRECTION_HASH[@facing] == 3
        return @facing = DIRECTION[0]
      end
      return @facing = DIRECTION[DIRECTION_HASH[@facing] + 1]
    elsif direction == 'L'
      if DIRECTION_HASH[@facing] == 0
        return @facing = DIRECTION[3]
      end
      return @facing = DIRECTION[DIRECTION_HASH[@facing] - 1]
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
