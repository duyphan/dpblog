#!/usr/bin/ruby
class Person
	def initialize(name)
	  @name = name
	end
	def to_s
	  "Person named #{@name}"
	end
end

p = Person.new("Duy Phan")
puts p