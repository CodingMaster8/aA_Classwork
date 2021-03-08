class Post < ApplicationRecord
  validates :title, :author_id, presence: true
  validates :subs, presence: true
  
  belongs_to :author
    class_name: "User"

  has_many :post_subs,
    foreign_key: :post_id,
    inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :post

end
