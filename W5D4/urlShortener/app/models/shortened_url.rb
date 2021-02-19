# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord

  validates :short_url, :user_id, presence: true, uniqueness: true
  validates :long_url, presence: true

  def self.random_code
    random_url = SecureRandom::urlsafe_base64
    random_url.exists? ? ShortenedUrl.random_code : random_url
  end
end
