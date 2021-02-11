class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

  def boss=(boss)
    @boss = boss
  end
end

class Manager < Employee
  attr_reader :employees
  
  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    queue = @employees.dup
    total_salary = 0

    until queue.empty?
      first = queue.shift
      total_salary += first.salary
      if first.is_a?(Manager)
        queue += first.employees
      end
    end
    total_salary * multiplier
  end

  def add_employee(employee)
    @employees << employee
  end

end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")

darren.add_employee(shawna)
darren.add_employee(david)

ned.add_employee(darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p shawna.bonus(3) # => 36_000
p david.bonus(3) # => 30_000