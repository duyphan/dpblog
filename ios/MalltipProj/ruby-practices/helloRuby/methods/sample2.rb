def meth_three
	100.times do |num|
		square = num*num
		return num, square if square > 1000
	end
end
puts meth_three # => [32, 1024]

print "(t)imes or (p)lus: "
operator = gets

print "number: "
number = Integer(gets)

if operator =~ /^t/
	puts (1..10).collect {|n| n*number }.join(", ")
else
	puts (1..10).collect {|n| n+number }.join(", ")
end