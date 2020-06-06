require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_PASSWORD']
  end

  get "/" do
    erb :welcome
  end

  helpers do

      def current_user
          User.find_by(id: session[:user_id])
      end

      def logged_in?
          !!current_user
      end

      def authenticate
          redirect '/login' if !logged_in?
      end

      def authorize(playlist)
          authenticate
          redirect '/playlists' if playlist.user != current_user
      end

  end
end
