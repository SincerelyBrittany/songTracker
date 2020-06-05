class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true
  validates :username, uniqueness: true
  has_many :playlists

  # #what has secure password is doing
  # def password(pw)
  #   self.password_digest = Digest::SHA2.hexidigest(pw)
  # end
  #
  # def authenicate(pw)
  #   Digest::SHA2.hexidigest(pw) == self.password_digest
  # end

end
