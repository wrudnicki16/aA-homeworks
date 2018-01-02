class Artwork < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true
  validates :artist_id, presence: true, uniqueness: { scope: :title, message: 'Should have a unique title per artist' }

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shared_viewers,
    through: :artist,
    source: :viewer
end
