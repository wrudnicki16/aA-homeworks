# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  def self.random_code
    rand_string = SecureRandom.urlsafe_base64
    while (self.exists?(rand_string))
      rand_string = SecureRandom.urlsafe_base64
    end
    rand_string
  end

  def self.create!(user, long_url)
    short = new(long_url: long_url, short_url: self.random_code, user_id: user.id)
    short.save!
  end

end
