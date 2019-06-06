class SessionsController < ApplicationController

  def new #login
    @user = User.new
    render :new
  end

  def create #logged in
    @user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )
    if @user
      #login
      @user.reset_session_token!
      redirect_to cats_url
    else
      #flash.now
      render :new
    end
  end

  def destroy #log out
    #log_out!
    redirect_to new_session_url
  end
end
