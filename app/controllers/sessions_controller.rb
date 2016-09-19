class SessionsController < ApplicationController
	def create
		user = user.find_by(email: params[:email])
		flash[:login_errors] = "Invalid Credentials." unless user && user.authenticate(params[:password])
		redirect_to :back
	end
end