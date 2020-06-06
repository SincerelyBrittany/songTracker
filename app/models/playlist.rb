class Playlist < ActiveRecord::Base
  belongs_to :user
  # has_many :songs

  def slug
  name.downcase.gsub(" ","-")
  end

def self.find_by_slug(slug)
  Playlist.all.find { |playlist| playlist.slug == slug }
end
end
