class User < ApplicationRecord

  has_many :enrollments,
    foreign_key: :student_id,
    class_name: Enrollment

  has_many :enrolled_courses,
    foreign_key: :course_id
    class_name: Course
end
