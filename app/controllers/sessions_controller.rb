class SessionsController < ApplicationController
  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to root_url, notice: "Logged in!"
    else
        flash.now.alert = "Email or password invalid."
    end
  end

  def destroy
  	  session[:user_id] = nil
  	  # does not show Logged out! message
  	  redirect_to root_url, notice: "Logged out!"
  end
end
