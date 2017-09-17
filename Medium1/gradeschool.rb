class School
  attr_reader :students

  def initialize
    @students = Hash.new { |students, grade| students[grade] = [] }
  end

  def add(name, grade)
    students[grade] << name
  end

  def to_h
    students.sort.map { |grade, names| [grade, names.sort] }.to_h
  end

  def grade(n)
    students[n]
  end
end
