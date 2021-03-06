class User < ApplicationRecord

  has_many :enrollments,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :enrolled_courses,
    through: :enrollments,
    source: :courses

  belongs_to :course,
    foreign_key: :instructor_id,
    class_name: :Course
end
