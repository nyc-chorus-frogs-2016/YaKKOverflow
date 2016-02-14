class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
  end

  def create
    if request.env["omniauth.auth"]
      auth = request.env["omniauth.auth"]
      session[:omniauth] = auth.except('extra')
      user = User.sign_in_from_omniauth(auth)
      session[:user_id] = user.id
      redirect_to questions_path
    else
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash.notice = "Welcome back to YaKK Overflow #{user.username}"
        redirect_to questions_path
      else
        flash[:error] = 'Login failed'
        render :new
      end
    end

  end



  def destroy
    session.clear
    redirect_to questions_path
  end
end
