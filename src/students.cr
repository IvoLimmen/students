class Student
  def initialize(name : String)
    @name = name
    @courses = Array(Course).new
  end

  def add_grade(course : String, grade : Float64)
    c = @courses.find {|c| c.name == course }
    if c.nil?
      c = Course.new course
      @courses << c
    end

    c.add_grade grade
  end

  def name
    @name
  end

  def totals
    puts "Grades for #{name}"
    @courses.each do |course|
      course.total
    end
    puts "Done"
  end
end

class Course
  def initialize(name : String)
    @name = name
    @grades = Array(Float64).new
  end

  def name
    @name
  end

  def add_grade(grade : Float64)
    @grades << grade
  end

  def total
    exams = @grades.size.to_f
    avg = @grades.sum.to_f / @grades.size.to_f
    puts "#{@name} - #{exams} exams - #{avg} avg"
  end
end

def help
  puts "Grading system"
  puts "add-student [name] - Add student"
  puts "select-student [name] - Select a student"
  puts "add-grade [course] [grade] - Add a grade for a course for the current selected student"
  puts "end - Stop the program"
end

command = nil
students = Array(Student).new
student = nil

until command == "end"
  puts "Input command"
  command = gets

  case command
  when .nil?
    puts "Please enter a valid command"
    help()
  when .includes?("add-student")
    name = command[11..-1].strip()
    student = Student.new name
    students << student
  when .includes?("select-student")
    name = command[11..-1].strip()
    student = students.find {|s| s.name == name }
    if student.nil?
      puts "Student #{name} not found"
    else
      puts "Student #{name} is selected"
    end
  when .includes?("add-grade")
    args = command[9..-1].strip().split()
    course = args[0]
    grade = args[1].to_f
    if student.nil?
      puts "No student selected, can not add a grade"
    else
      student.add_grade(course, grade)
    end
  when "help"
    help()
  else
    puts "Unknown command: #{command}"
    help()
  end
end

students.each do |student|
  student.totals
end
