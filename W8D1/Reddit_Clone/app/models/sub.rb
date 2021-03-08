class Sub < ApplicationRecord

  belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: :User

  # has_many :posts,
  #   foreign_key: :sub_id,
  #   class_name: "Post"

  has_many :post_subs,
    foreign_key: :sub_id,
    inverse_of: :sub

  has_many :posts,
    through: :post_subs,
    source: :sub



end
