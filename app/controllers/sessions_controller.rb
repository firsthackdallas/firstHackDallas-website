class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/teams'
		else
			flash[:login_errors] = "Invalid Credentials."
			redirect_back fallback_location: '/'
		end
	end
	def destroy
		reset_session
		redirect_to '/'
	end
end