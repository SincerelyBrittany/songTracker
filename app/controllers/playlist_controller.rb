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

#    post '/wines' do
#     country = Country.find_by(name: params[:country])
#     @wine = Wine.new(
#     name: sanitize(params[:name]),
#     country: country,
#     wine_type: sanitize(params[:wine_type]),
#     price: params[:price],
#     year_sealed: params[:year]
#   )
#   if @wine.save
#     current_user.wines << @wine
#     redirect "users/#{current_user.slug}"
#   else
#     @countries = Country.all.order(:name)
#     erb :'wines/new'
#   end
#
# end

#
#    post '/watchlists' do
#   authenticate
#  if params[:watchlist][:stock] == nil
#    @watchlist = current_user.watchlists.new(name: Sanitize.fragment(params[:watchlist][:name]), user_id: params[:user_id])
#    # binding.pry
#    if @watchlist.save
#    redirect "/watchlists"
#    else
#      redirect "/watchlists/new"
#    end
# else
#   @stock = Stock.create(name: params[:watchlist][:stock][:name], price: params[:watchlist][:stock][:price],
#   logo: params[:watchlist][:stock][:logo], ceo: params[:watchlist][:stock][:ceo],
#   description: params[:watchlist][:stock][:description], ticker: params[:watchlist][:stock][:ticker])
#   @watchlist = Watchlist.find(params[:watchlist][:id][0])
#   @watchlist.stocks << @stock
#
#   redirect "/watchlists/#{@watchlist.id}"
# end
# end



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
