class ApplicationController < ActionController::Base
  helper_method :user,
                :logged_in?

  private

  def user_auth
    return if logged_in?

    cookies[:params] = params.to_json
    redirect_to login_path, alert: 'Verefy your Email and Password please'
  end

  def user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    user.present?
  end
end
