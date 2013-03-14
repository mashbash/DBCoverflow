class UsersController < ApplicationController

  def index
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'sessions/new'
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
  end

end
