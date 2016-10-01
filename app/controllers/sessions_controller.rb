class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/teams'
		else
			errors = {
				error: {
					msg: 'Invalid Credentials.'
				}
			}
			render json: errors.to_json
		end
	end
	def destroy
		reset_session
		redirect_to '/'
	end
end