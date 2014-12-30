Before do |scenario|
puts "Starting scenario #{scenario.name}"
end

After do |scenario|
puts "Oh dear" if scenario.failed?
end