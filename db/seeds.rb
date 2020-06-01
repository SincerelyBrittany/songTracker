users_list = [
  [ "John Smith", "j.smith@aol.com", "NY", "25" ],
  [ "Karen Snow", "k.snow@yahoo.com", "CA", "30" ],
  [ "Roger Rabbit","rr@roadrunner.com", "FL", "40" ],
  [ "Bugs Bunny", "bugs.bunny@gmail.com", "TX", "100" ]
]

users_list.each do |username, email, location, age|
  User.create(username: username, email: email, location: location, age: age)
end
