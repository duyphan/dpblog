#!/usr/bin/ruby
puts "BLOCK LOOP OF NUMBER"
num = 1001
6.times do
	puts "#{num.class} : #{num}"
	num *= num
end

puts "RANDOM NUMBER"
puts Random.new.rand(1..100)

puts "POWER OF TWO"
class PowerOfTwo
	attr_reader :value
	def initialize(value)
		@value = value
	end
	def <=>(other)
		@value <=> other.value
	end
	def succ
		PowerOfTwo.new(@value + @value)
	end
	def to_s
		@value.to_s
	end
end
p1 = PowerOfTwo.new(4)
p2 = PowerOfTwo.new(32)
a = (p1..p2).to_a

puts a

puts "RANGE"

puts "PLS ENTER NUMBER TO TEST : "
car_age = gets.to_f # let's assume it's 9.5

case car_age
when 0..0
	puts "Mmm.. new car smell"
when 1..2
	puts "Nice and new"
when 3..9
	puts "Reliable but slightly dinged"
when 10..29
	puts "Clunker"
else
	puts "Vintage gem"
end