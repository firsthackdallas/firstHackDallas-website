class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	def new
	end
	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			user_count = User.count - Admin.count
			if user_count > 4
				WaitList.create(user_id: user.id)
			end
			redirect_to '/teams'
		else
			flash[:registration_errors] = user.errors
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