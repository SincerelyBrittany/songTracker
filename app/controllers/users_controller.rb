class UsersController < ApplicationController

  get '/users/:id' do
    if !logged_in?
      redirect '/songs' #bags
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/songs' #bags
    end
  end

  get '/signup' do
    # binding.pry
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/playlists' #clubs
    end
  end

  post '/signup' do
    # binding.pry
    #sign-up params = params => {"username"=>"Autumn", "email"=>"leaves@yahoo.com", "location"=>"NY", "age"=>"14", "password"=>"bestdog"}
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username],
                          :password => params[:password],
                          :email => params[:email],
                          :location => params[:location],
                          :age => params[:age])
      session[:user_id] = @user.id
      redirect '/playlists'
    end
  end

  get '/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/playlists'
    end
  end

  post '/login' do
    #binding.pry #> params => {"username"=>"Autumn", "password"=>"bestdog"}
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/playlists"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
