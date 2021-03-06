class SongsController < ApplicationController

  get '/songs/new' do #loads new form
    if params.empty?
      erb :'songs/new'
    else
      @playlist = current_user.playlists.find_by(params[:id])
      authorize(@playlist)
      erb :'songs/new'
    end
  end

  post '/songs' do #loads index page
    # binding.pry
    @playlists = current_user.playlists
    @query = params[:song][:name]
    all_tracks = APImanager.search_tracks("#{@query}")
    @tracks = all_tracks.map do |track|
      Song.new(name: track[:title],
        id: track[:id],
        picture: track[:artwork_url],
        url: track[:permalink_url],
        genre: track[:genre])
      end
     if params.has_key?(:playlist) 
        @playlist = current_user.playlists.find_by(params[:playlist][:id])
        # binding.pry
        erb :'songs/song_playlist_index'
      else 
        erb :'songs/index'
      end
  end

end



  # get '/songs/:id' do  #loads show page
  #   @song = Song.find_by_id(params[:id])
  #   erb :show
  # end
  #
  # get '/songs/:id/edit' do #loads edit form
  #   @song = Song.find_by_id(params[:id])
  #   erb :edit
  # end
  #
  # patch '/songs/:id' do  #updates a recipe
  #   @song = Song.find_by_id(params[:id])
  #   @song.name = params[:name]
  #   @song.genre = params[:genre]
  #   # @song.artist_id = params[:artist_id]
  #   @song.save
  #   redirect to "/songs/#{@song.id}"
  # end
  #
  # post '/songs' do  #creates a recipe
  #   @song = Song.create(params)
  #   redirect to "/songs/#{@song.id}"
  # end
  #
  # delete '/songs/:id' do #destroy action
  #   @song = Song.find_by_id(params[:id])
  #   @song.delete
  #   redirect to '/songs'
  # end
