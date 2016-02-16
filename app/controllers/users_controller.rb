class UsersController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thanks for registering"
      session[:user_id] = @user.id
      redirect_to questions_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:uid, :password, :password_confirmation, :name, :provider)
  end

end
