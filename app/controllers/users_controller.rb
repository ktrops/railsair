class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		# if @user.errors[:email].any?
		# 	redirect_to root_url, notice: @user.errors.messages
		# end
		# if @user.invalid?
		# 	redirect_to root
		if @user.save
			session[:user_id] = @user.id
			redirect_to inquiry_path, notice: "You have signed up"

		else
			redirect_to root_url, notice: "Try again"
		end
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
	end
