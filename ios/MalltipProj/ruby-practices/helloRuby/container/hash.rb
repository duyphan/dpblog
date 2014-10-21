#!/src/bin/ruby
h = { 'dog' => 'canine' , 'cat' => 'feline' , 'donkey' => 'asinine' }

puts h
puts h.length # => 3
puts h['dog'] # => "canine"
h['cow'] = 'bovine'
h[12] = 'dodecine'
h['cat'] = 99

puts ":D"
puts h

# Word Frequency: Using Hashes and Arrays
def words_from_string(string)
	string.downcase.scan(/[ \w']+/)
end

p words_from_string("But I didn't inhale, he said (emphatically)")


def count_frequency(word_list)
	counts = Hash.new(0)
	for word in word_list
		counts[word] += 1
	end
	counts
end

p count_frequency(["sparky" , "the", "cat", "sat", "on", "the", "mat"])

def fib_up_to(max)
	i1, i2 = 1, 1 # parallel assignment (i1 = 1 and i2 = 1)

while i1 <= max
	yield i1
		i1, i2 = i2, i1+i2
	end
end

fib_up_to(1000) {|f| print f, " " }
puts