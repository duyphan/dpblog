def cool_dude(arg1="Miles", arg2="Coltrane", arg3="Roach")
	"#{arg1}, #{arg2}, #{arg3}."
end

def surround(word, pad_width=word.length/2)
	"[" * pad_width + word + "]" * pad_width
end

def varargs(arg1, *rest)
	"arg1= #{arg1}. rest=#{rest.inspect}"
end

puts cool_dude # => "Miles, Coltrane, Roach."
puts cool_dude("Bart" ) # => "Bart, Coltrane, Roach."
puts cool_dude("Bart" , "Elwood" ) # => "Bart, Elwood, Roach."
puts cool_dude("Bart" , "Elwood" , "Linus") # => "Bart, Elwood, Linus."

puts surround("elephant") # => "[[[[elephant]]]]"
puts surround("fox") # => "[fox]"
puts surround("fox", 10) # => "[[[[[[[[[[fox]]]]]]]]]]"

puts varargs( "one") # => arg1=one. rest=[]
puts varargs( "one", "two") # => arg1=one. rest=["two"]
puts varargs "one", "two", "three" # => arg1=one. rest=["two", "three"]

class TaxCalculator
	def initialize(name, &block)
		@name, @block = name, block
	end
	def get_tax(amount)
		"#@name on #{amount} = #{ @block.call(amount) }"
	end
end

tc = TaxCalculator.new( "Sales tax") {|amt| amt * 0.075 }
puts tc.get_tax(100) # => "Sales tax on 100 = 7.5"
puts tc.get_tax(250) # => "Sales tax on 250 = 18.75"