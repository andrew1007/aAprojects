class Course < ActiveRecord::Base

  # has_many :course_enrollments,
  # primary_key: :id,
  # foreign_key: :course_id,
  # class_name: :Enrollment
  #
  # has_many :enrolled_students,
  # through: :course_enrollments,
  # source: :user

  belongs_to :class_periods,
  primary_key: :id,
  foreign_key: :period_id,
  class_name: :Period
end
