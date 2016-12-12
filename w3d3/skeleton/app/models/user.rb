class User < ActiveRecord::Base

  has_many :user_enrollments,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: :Enrollment

  has_many :enrolled_courses,
  through: :user_enrollments,
  source: :course

  has_many :courses_periods,
  through: :enrolled_courses,
  source: :class_periods
end
