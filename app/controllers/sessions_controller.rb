class SessionsController < ApplicationController
  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def new
    @user = User.new
  end
  
end
