class User < ActiveRecord::Base
  # has_secure_password
  # validates :email, :presence => true
  # validates :username, uniqueness: true
  # has_many :playlists

  # #what has secure password is doing
  # def password(pw)
  #   self.password_digest = Digest::SHA2.hexidigest(pw)
  # end
  #
  # def authenicate(pw)
  #   Digest::SHA2.hexidigest(pw) == self.password_digest
  # end


  has_secure_password
has_many :playlists
validates :username, uniqueness: true
validates :username, presence: true
validates :email, presence: true

def slug
  self.username.downcase.tr(" ","-")
end


  def self.find_by_slug(slug)
    User.all.find { |user| user.slug == slug }
  end

end
