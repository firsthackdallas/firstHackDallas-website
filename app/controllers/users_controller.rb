class UsersController < ApplicationController
	def new
	end
	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to '/teams'
		else
			flash[:registration_errors] = user.errors
			print user.errors.full_messages
			redirect_to '/users/new'
		end
	end
	def add_team
		user = User.find(session[:user_id])
		user[:team_id] = params[:id]
		user.save
		redirect_to '/teams'
	end
	def remove_team
		user = User.find(session[:user_id])
		user.team_id = nil
		user.save
		redirect_to '/teams'
	end
	def destroy
		User.destroy(params[:id])
		redirect_to '/admins/dashboard'
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :avatar, :password, :password_confirmation)
		end
end