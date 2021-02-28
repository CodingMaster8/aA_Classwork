class Cat < ApplicationRecord
  COLORS = ["Red","Orange","Blue","Yellow","White","Black","Green","Grey","Rainbow"]
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: ["M", "F"]
  validates :color, inclusion: COLORS

  has_many :rental_requests,
    foreign_key: :cat_id,
    class_name: "CatRentalRequest"

  def age
    age = 0
    birthday = self.birth_date
    present = Date.today
    # (Time.zone.now - birthday.to_time) / 1.year.seconds.floor
    age = present.year - birthday.year
    if birthday.mon < present.mon 
      return age
    elsif birthday.mon == present.mon && birthday.mday <= present.mday
      return age
    else
      age -= 1
    end
    age
  end
end
