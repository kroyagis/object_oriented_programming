class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Student
  def learn
    puts 'I get it!'
  end
end

class Instructor
  def teach
    puts 'Evertyhing in Ruby is an Object'
  end
end
