class UsersController < ApplicationController

  get '/signup' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    # @user.password = params[:password]
    # if @user.save
    #   redirect '/login' #This is a redirect
    # else
    erb :'users/new' #THis is a render
    # end
  end
 end
