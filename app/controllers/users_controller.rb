class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_profile_parameters)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			render "new"
		end
	end

	private
	def user_profile_parameters
		params.require(:user).permit(:password, :password_confirmation, :email)
	end
end
