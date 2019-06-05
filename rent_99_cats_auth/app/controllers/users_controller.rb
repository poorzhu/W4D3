class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user)
    else
      # flash.now
      render :new
    end
  end


  private

  def user_params
    params.require(:users).permit(:user_name, :password_digest, :session_token)
  end
end
