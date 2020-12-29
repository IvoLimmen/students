require "./course"

class Student
  def initialize(name : String)
    @name = name
    @courses = Array(Course).new
  end

  def add_grade(course : String, grade : Float64)
    c = @courses.find {|i| i.name == course }
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
