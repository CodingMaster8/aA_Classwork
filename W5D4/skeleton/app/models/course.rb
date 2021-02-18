class Course < ApplicationRecord

  belongs_to :enrollment,
    foreign_key: :course_id,
    class_name: :Enrollment
end
