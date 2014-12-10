File.open("testfile.txt") do |file|
	file.each_byte.with_index do |ch, index|
		print "#{ch.chr}:#{ch} "
		break if index > 10
	end
end


File.open("output.txt", "w" ) do |file|
	file.puts "Hello"
	file.puts "1 + 2 = #{1+2}"
end