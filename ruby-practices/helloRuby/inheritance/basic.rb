#!/src/bin/ruby
class Parent
	def say_hello
		puts "Hello from #{self}"
	end
end

p = Parent.new
p.say_hello

# Subclass the parent...
class Child < Parent

end

class Child2 < Child

end

c = Child.new
c.say_hello

c2 = Child2.new
c2.say_hello