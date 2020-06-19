#MUST WORK ON
# require 'rack-flash'
class PlaylistsController < ApplicationController
 # use Rack::Flash

  get '/playlists' do #works
     authenticate
     @playlists = current_user.playlists
      # binding.pry
     erb :'playlists/index'
   end

   get '/playlists/new' do #works
     authenticate
     erb :'/playlists/new'
   end

   post '/playlists' do
     authenticate
     binding.pry
     @playlist = Playlist.new(name: params[:playlist][:name], user_id: current_user.id)

        if @playlist.save
          redirect "/playlists"
        else
           redirect "/playlists/new"
        end
   end


   get '/playlists/:id/edit' do
     # binding.pry
     @playlist = Playlist.find_by(id: params[:id])
     authorize(@playlist)
     # binding.pry
     erb :'/playlists/edit'
   end

   patch '/playlists/:id' do
     @playlist = Playlist.find_by(id: params[:id])
     authorize(@playlist)
     if @playlist.update(name: params[:playlist][:name])
       redirect "users/#{current_user.id}"
     else
       redirect "/playlists/#{@playlist.id}/edit"
     end
   end

   get '/playlists/:id' do
     authenticate
     @playlist = Playlist.find_by(id: params[:id])
      # authorize(@playlist.user)
     erb :'/playlists/show'
   end

   delete '/playlists/:id' do
     @playlist = Playlist.find_by(id: params[:id])
     authorize(@playlist)
     @playlist.destroy
     redirect "users/#{current_user.id}"
   end

end
