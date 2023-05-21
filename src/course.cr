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
    exams = @grades.size.to_i
    avg = @grades.sum.to_f / @grades.size.to_f
    puts "#{@name} - #{exams} exams - #{avg} avg"
  end
end
