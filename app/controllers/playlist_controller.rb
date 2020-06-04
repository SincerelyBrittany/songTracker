class PlaylistsController < ApplicationController

  #Need to update so that only current user can view playlist

  get '/playlists/new' do #loads new form
    redirect_if_not_logged_in
    erb :'playlists/new'
  end


  get '/playlists' do #loads index page
    if logged_in?
          @user = current_user.id
          @playlists = Playlist.where("user_id = #{@user}")
          # binding.pry
            #.where("orders_count = '2'")
            #SELECT * FROM playlists WHERE user_id = current_user;
        erb :'playlists/index'
    else
        redirect_if_not_logged_in
    end
    end


  get '/playlists/:id' do  #loads show page
    redirect_if_not_logged_in
    @playlist = Playlist.find_by_id(params[:id])
    erb :'playlists/show'
  end


  get '/playlists/:id/edit' do #loads edit form
    redirect_if_not_logged_in
    @playlist = Playlist.find_by_id(params[:id])
    # binding.pry
    erb :'playlists/edit'
  end

  patch '/playlists/:id' do  #updates a recipe
    redirect_if_not_logged_in
    @playlist = Playlist.find_by_id(params[:id])
    # binding.pry
    @playlist.name = params[:playlist][:name]
    # @playlist.genre = params[:genre]
    # @song.artist_id = params[:artist_id]
    @playlist.save
    redirect to "/playlists"
  end

  post '/playlists' do  #creates a recipe
    redirect_if_not_logged_in
    @playlist = Playlist.create(params[:playlist])
    # binding.pry
    if @playlist.user_id == nil
      @playlist.user_id = current_user.id
    end
      @playlist.save

    redirect to "/playlists"
  end


  delete '/playlists/:id' do #destroy action
    redirect_if_not_logged_in
    @playlist = Playlist.find_by_id(params[:id])
    @playlist.delete
    redirect to '/playlists'
  end
end
