class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find_by(params[:id])
    authorize_user(@user)
    erb :'users/show'
  end

  get '/users/:id/edit' do
    @user = User.find_by(params[:id])
    authorize_user(@user)
    erb :'users/edit'
  end

  patch '/users/:id' do
    @user = User.find_by(params[:id])
    authorize_user(@user)
    if @user.update(username: sanitize(params[:username]), email: params[:email], password: params[:password])
      redirect "users/#{@user.id}"
    else
      erb :"users/<%=@user.id%>/edit"
    end
  end

end
