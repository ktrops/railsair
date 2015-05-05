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
  
end
