def show_regexp(string, pattern)
	match = pattern.match(string)
	if match
		"#{match.pre_match} ->#{match[0]} <-#{match.post_match}"
	else
		"no match"
	end
end

str = "this is\nthe time"
puts show_regexp(str, /^the/) # => this is\n->the<- time
puts show_regexp(str, /is$/) # => this ->is<-\nthe time
puts show_regexp(str, /\Athis/) # => ->this<- is\nthe time
puts show_regexp(str, /\Athe/) # => no match