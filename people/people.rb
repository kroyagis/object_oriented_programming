class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Student < Person
  def learn
    puts 'I get it!'
  end
end

class Instructor < Person
  def teach
    puts 'Evertyhing in Ruby is an Object'
  end
end
