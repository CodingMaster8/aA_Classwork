class Enrollment < ApplicationRecord

  belongs_to :student,
    foreign_key: :student_id,
    class_name: :User

  has_many :courses,
    foreign_key: :course_id,
    class_name: :Course
end
