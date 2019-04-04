class SessionsController < ApplicationController
  def login; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to JSON.parse cookies[:params]
    else
      render :login
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end
end
