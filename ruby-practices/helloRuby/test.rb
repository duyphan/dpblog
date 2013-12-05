class Person
  attr_reader :fname, :lname
  def initialize(fname, lname)
   @fname = fname
   @lname = lname
  end
  def to_s
     "Person: #@fname #@lname"
  end
end
person = Person.new("Augustus","Bondi")
print person
print "\n"

class Employee < Person
  def initialize(fname, lname, position)
    super(fname,lname)
    @position = position
  end
  def to_s
     super + ", #@position"
  end
end
employee = Employee.new("Augustus","Bondi","CFO")
print employee
print "\n"

print employee.fname