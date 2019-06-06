class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    @user = User.find_by(session_token: params[:session_token])
  end

  def logout!
    ##nil?
    current_user.reset_session_token! if current_user

  end


end
