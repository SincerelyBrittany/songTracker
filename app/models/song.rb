class Song < ActiveRecord::Base
  belongs_to :user
  # has_many :playlist_songs, dependent: :destroy
  # has_many :playlists, through: :playlist_songs

  has_many :playlists
end
