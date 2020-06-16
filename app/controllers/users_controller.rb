#MUST WORK ON
class UsersController < ApplicationController
  get '/users/:slug' do
    user = User.find_by_slug(params[:slug])
    @playlists = user.playlists
    erb :'users/show'
  end

end
