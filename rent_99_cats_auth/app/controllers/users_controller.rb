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
  
  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def edit
    @user = User.find_by(id: params[:id])
    render :edit    
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_url(@user)
    else
      ###Flash
      render json: @user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to users_url
  end

  private

  def user_params
    params.require(:users).permit(:user_name, :password_digest, :session_token)
  end
end
