class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
		else
			flash[:login_errors] = "Invalid Credentials."
		end
		redirect_to :back
	end
	def destroy
		reset_session
		redirect_to '/'
	end
end