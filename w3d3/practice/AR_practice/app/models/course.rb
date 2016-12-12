class Course < ActiveRecord::Base

  belongs_to :instructor,
  primary_key: :id,
  foreign_key: :instructor_id,
  class_name: :User

  has_many :enrollments,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: :Enrollment

  has_many :enrolled_students,
  through: :enrollments,
  source: :user
end
