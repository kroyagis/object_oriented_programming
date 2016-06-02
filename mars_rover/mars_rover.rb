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
    
  end
end
