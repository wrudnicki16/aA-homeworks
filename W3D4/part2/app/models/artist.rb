class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    albums = self
      .albums
      # keep individual album data for later use
      # save the aggregate for later
      .select('albums.*, COUNT(*) AS track_count')
      .joins(:tracks)
      .group('albums.id')


    album_counts = {}
    albums.each do |album|
      album_counts[album.title] = album.track_count
    end
    album_counts
  end
end
