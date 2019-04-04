class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_param)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :signup
    end
  end

  private

  def user_param
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
