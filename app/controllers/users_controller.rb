class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def new
    @user = User.new
  end

  def show
    if session[:user_id] != params[:id].to_i 
        redirect_to current_user
    else
      @user = User.find(params[:id])
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Travel Stories"
      redirect_to @user
    else
      render 'new'
    end
  end


  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :LastName, :FirstName)
    end
end
