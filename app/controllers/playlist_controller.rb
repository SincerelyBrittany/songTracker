#MUST WORK ON
class PlaylistsController < ApplicationController

  get '/playlists' do #works
     authenticate
     @playlists = current_user.playlists
     erb :'playlists/index'
   end

   get '/playlists/new' do #works
     authenticate
     erb :'/playlists/new'
   end

   post '/playlists' do
     authenticate
     # binding.pry
     Playlist.create(name: params[:playlist][:name], user_id: current_user.id)
     redirect '/playlists'
   end

   get '/playlists/:id/edit' do
     @playlist = Playlist.find_by(id: params[:id])
     authorize(@playlist)
     # binding.pry
     erb :'/playlists/edit'
   end

   patch '/playlists/:id' do
     @playlist = Playlist.find_by(id: params[:id])
     authorize(@playlist)
     if @playlist.update(name: params[:playlist][:name])
       redirect '/playlists'
     else
       redirect "/playlists/#{@playlist.id}/edit"
     end
   end

   get '/playlists/:id' do
     authenticate
     @playlist = Playlist.find_by(id: params[:id])
     erb :'/playlists/show'
   end

   delete '/playlists/:id' do
     @playlist = Playlist.find_by(id: params[:id])
     authorize(@playlist)
     @playlist.destroy
     redirect '/playlists'
   end

end
