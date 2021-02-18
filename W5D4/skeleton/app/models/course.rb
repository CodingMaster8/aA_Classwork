class Course < ApplicationRecord

  has_many :enrollments,
    foreign_key: :course_id,
    class_name: :Enrollment

  has_many :enrolled_students,
    through: :enrollments,
    source: :student

  has_one :prerequisite,
    foreign_key: :prereq_id,
    class_name: :Course
  
  belongs_to :requisite,
    foreign_key: :prereq_id,
    class_name: :Course

  has_one :instructor,
    foreign_key: :instructor_id,
    class_name: :User

end
