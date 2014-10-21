class ProjectList
	def initialize
		@projects = []
	end
	def projects=(list)
		@projects = list.map(&:upcase) # store list of names in uppercase
	end
	def [](offset)
		@projects[offset]
	end
end

list = ProjectList.new
list.projects = %w{ strip sand prime sand paint sand paint rub paint }

puts list[3] # => "SAND"
puts list[4] # => "PAINT"
a = 128
until a < 100
	a -= 10
	puts a
end