class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to episodes_path
    else
      redirect_to '/login', alert: "Incorrect username or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
