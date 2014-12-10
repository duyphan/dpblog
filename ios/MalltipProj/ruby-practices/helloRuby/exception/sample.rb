require 'open-uri'
web_page = open("http://pragprog.com/podcasts")
output = File.open("podcasts.html", "w" )
begin
	while line = web_page.gets
		output.puts line
	end
	output.close
rescue Exception
	STDERR.puts "Failed to download #{page}: #{$!}"
	output.close
	File.delete(file_name)
	raise
end

require 'open-uri'
page = open('http://google.com.vn').read
if page =~ %r{<title>(.*?)</title>}m
	puts "Title is #{$1.inspect} "
end