require "./student"
require "./course"

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

until command == "end" || command == "quit"
  puts "Input command:"
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
  when "end" || "quit"
    # ignore
  when "help"
    help()
  else
    puts "Unknown command: #{command}"
    help()
  end
end

students.each do |s|
  s.totals
end
