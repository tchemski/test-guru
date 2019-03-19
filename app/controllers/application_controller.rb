class ApplicationController < ActionController::Base

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def user_auth
    # TODO: пока нет аутентификации первого попавшегося пользователя
    @user = User.take
  end
end
