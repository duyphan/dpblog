class MathWiz
  def add(a,b)
    return a+b
  end
  def method_missing(name, *args)
    puts "I don't know the method #{name}"
  end
end
mathwiz = MathWiz.new
puts mathwiz.add(1,4)
puts mathwiz.subtract(4,2)