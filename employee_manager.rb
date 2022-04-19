class Employee

  attr_reader :name,:title,:salary,:boss
  def initialize(name,salary,title,boss)
    @name,@title,@salary,@boss = name,title,salary,boss
  end

  def bonus(multiplier=1)
    bonus = salary * multiplier
  end

end


class Manager < Employee
  attr_reader :employees
  def initialize(name,salary,title,boss)
    @employees = []
    super(name,title,salary,boss)
  end

  def bonus(multiplier=1)
    _bonus = 0
    @employees.each{|e|bonus += e.bonus}
    _bonus * multiplier
  end

  def add_employees(*subs)
    @employees += subs
  end

end


ned = Manager.new("Ned", 1000000, "Founder", nil)
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)
ned.add_employees(darren)
darren.add_employees(shawna,david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_0000
p shawna.bonus(2)