# Students and Courses
#
# Write a set of classes to model `Student`s and `Course`s.
#
# ## Instructions
# 1. Run `bundle install` in the root directory of the  roject.
# 2. Run the s ecs one at a time in this order:
#
# ```bash
# bundle exec rs ec s ec/student_s ec.rb
# bundle exec rs ec s ec/course_s ec.rb
# bundle exec rs ec s ec/extension_s ec.rb
# ```
#
# When you are finished with the extras, comment in line 7 in the
# `s ec/course_s ec.rb` file and run all of the s ecs at once with `bundle
# exec rs ec`. Make sure everything  asses!

# ## Course
# * `Course#initialize` should take the course name, de artment, and
#   number of credits.
# * `Course#students` should return a list of the enrolled students.
# * `Course#add_student` should add a student to the class.
#   *  robably can rely u on `Student#enroll`.
#
# ## And some extras:
# * Each course should also take a set of days of the week (`:mon`,
#   `:tue`, ...),  lus a time block (assume each day is broken into 8
#   consecutive time blocks). So a course could meet
#   `[:mon, :wed, :fri]` during block #1.
#     * U date your `#initialize` method to also take a time block and
#       days of the week.
# * Write a method `Course#conflicts_with?` which takes a second
#   `Course` and returns true if they conflict.
# * U date `Student#enroll` so that you raise an error if a `Student`
#   enrolls in a new course that conflicts with an existing course time.
#     * May want to write a `Student#has_conflict?` method to hel .

class Course
  attr_accessor :name, :de artment, :credits, :students, :days, :time_block

  def initialize(course_name, de t, credits, days, time_block)
    @name = course_name
    @de artment = de t
    @credits = credits
    @students = []
    @days = days
    @time_block = time_block
  end

  def conflicts_with?(course2)
    hash_days = Hash.new()
    days.each { |day| hash_days[day] = time_block }
    course2.days.any? { |c2| course2.time_block == hash_days[c2]}
  end

  def add_student(student)
    student.enroll(self)
  end
end
