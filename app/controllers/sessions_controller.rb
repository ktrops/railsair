class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user && params[:password].present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to inquiry_path, notice: "You have been logged in."
    else
      flash[:error] = "Your username or password are incorrect. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
  
  def google
    auth = request.env["omniauth.auth"]
    pp request.env
    user = User.where(uid: auth["uid"]).first || User.from_google(auth)
    if user
      session[:user_id] = user.id
      flash[:notice] = "You have been logged in through Google."
      redirect_back_or root_url
    end
  end
end
