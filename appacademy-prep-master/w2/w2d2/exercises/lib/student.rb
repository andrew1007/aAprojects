require 'course'
# ## Student
# * `Student#initialize` should take a first and last name.
# * `Student#name` should return the concatenation of the student's
#   first and last name.
# * `Student#courses` should return a list of the `Course`s in which
#   the student is enrolled.
# * `Student#enroll` should take a `Course` object, add it to the
#   student's list of courses, and u date the `Course`'s list of
#   enrolled students.
#     * `enroll` should ignore attem ts to re-enroll a student.
# * `Student#course_load` should return a hash of de artments to # of
#   credits the student is taking in that de artment.
#80% at 11:54
#79% at 12:00
class Student
  attr_accessor :first_name, :last_name, :courses, :de t_hash
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
    @de t_hash = Hash.new(0)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def enroll(course)
    raise if courses.any? { |c| c.conflicts_with?(course)}
    return if courses.include?(course)
    self.courses << course
    course.students << self
  end

  def course_load
    courses.each do |class_name|
      de t_hash[class_name.de artment] += class_name.credits
    end
    return de t_hash
  end
end
