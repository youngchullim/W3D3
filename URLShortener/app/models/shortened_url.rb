# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'securerandom'

class ShortenedUrl < ApplicationRecord
  include SecureRandom

  validates :long_url, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.random_code
    random = SecureRandom.urlsafe_base64
    ShortenedUrl.exists?(random) ? self.random_code : random
  end

  def self.create!(long, user)
    short = self.random_code
    new_short = ShortenedUrl.new(long_url: long, short_url: short, user_id: user.id)
    # new_short.save -- returns true
  end
  
end
