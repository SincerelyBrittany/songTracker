# class SongsController < ApplicationController
#
#   get '/songs/new' do #loads new form
#     erb :new
#   end
#
#   get '/songs' do #loads index page
#     @songs = Song.all
#     erb :index
#   end
#
#   get '/songs/:id' do  #loads show page
#     @song = Song.find_by_id(params[:id])
#     erb :show
#   end
#
#   get '/songs/:id/edit' do #loads edit form
#     @song = Song.find_by_id(params[:id])
#     erb :edit
#   end
#
#   patch '/songs/:id' do  #updates a recipe
#     @song = Song.find_by_id(params[:id])
#     @song.name = params[:name]
#     @song.genre = params[:genre]
#     # @song.artist_id = params[:artist_id]
#     @song.save
#     redirect to "/songs/#{@song.id}"
#   end
#
#   post '/songs' do  #creates a recipe
#     @song = Song.create(params)
#     redirect to "/songs/#{@song.id}"
#   end
#
#   delete '/songs/:id' do #destroy action
#     @song = Song.find_by_id(params[:id])
#     @song.delete
#     redirect to '/songs'
#   end
# end
