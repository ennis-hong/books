class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(set_user)
    if @user.save
      redirect_to root_path, notice: "註冊成功"
    else
      render :new
    end
  end

  def sign_in
  end

  def set_user
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
