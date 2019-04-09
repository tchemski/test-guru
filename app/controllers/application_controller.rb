class ApplicationController < ActionController::Base
  helper_method :current_user,
                :logged_in?

  private

  def user_auth
    return if logged_in?

    cookies[:params] = params.to_json
    redirect_to login_path, alert: 'Verefy your Email and Password please'
  end
end

__END__

def user_auth
  return if logged_in?

  cookies[:params] = params.to_json
  redirect_to login_path, alert: 'Verefy your Email and Password please'
end

def current_user
  current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
end

def logged_in?
  current_user.present?
end
