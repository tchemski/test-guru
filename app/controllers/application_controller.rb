class ApplicationController < ActionController::Base

  private

  def user_auth
    # TODO: пока нет аутентификации первого попавшегося пользователя
    @user = User.take
  end
end
