class Cat

  def initialize(name, preferred_food, meal_time)
    @name = name
    @preferred_food = preferred_food
    @meal_time = meal_time
  end

  def eats_at
    if @meal_time == 0
      return "12 AM"
    elsif @meal_time == 12
      return "12 PM"
    elsif @meal_time < 12
      return "#{@meal_time} AM"
    elsif @meal_time > 12
      return "#{@meal_time - 12} PM"
    else
      "Invalid hour"
    end
  end

  def meow
    "Hi! My name is #{@name}, please feed me #{@preferred_food} at #{eats_at}!"
  end
  
end
