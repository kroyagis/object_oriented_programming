class Mars_rover
  attr_accessor :x, :y, :direction


  def initialize(x, y, facing)
    @x = x
    @y = y
    @facing = facing
    @ways = ['N', 'E', 'S', 'W']
    @hashways = Hash[@ways.map.with_index.to_a]
  end

  def read_instruction

  end

  def move

  end

  def turn
    if turn_right
      if @hashways[@facing] == 3
        return @facing = @ways[0]
      end
      return @facing = @ways[@hashways[@facing] + 1]
    elsif turn_left
      if @hashways[@facing] == 0
        return @facing = @ways[3]
      end
      return @facing = @ways[@hashways[@facing] - 1]
    end
  end
end
