require 'mail'

class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	def new
	end
	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			user_count = User.count - Admin.count
			if user_count > 70
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
	def remove_from_wait_list
		WaitList.destroy(params[:id])
		redirect_to '/admins/dashboard'
	end
	def edit_password

	end
	def reset_password
		token = ResetPassword.find_by(token: params[:token])
		if user_params[:password] != user_params[:password_confirmation]
			flash[:errors] = 'Password and Password Confirmation do not match.'
			redirect_to "/password/reset/" + params[:token]
		elsif token
			user = token.user
			user.password = user_params[:password]
			user.save
			ResetPassword.destroy(token.id)
			redirect_to '/password/reset/confirmation'
		else
			flash[:errors] = "Bad password reset token."
			redirect_to "/password/reset/" + params[:token]
		end
	end
	def password_reset_confirmation

	end
	# TODO: Implement proper password recovery
	# def recover_password

	# end
	# def request_password_recovery_token
	# 	user = User.find_by(email: user_params[:email])
	# 	if user
	# 		token = (0...12).map { (65 + rand(26)).chr }.join
	# 		ResetPassword.create(token: token, user: user)
	# 		mail = Mail.new do
	# 		  from     'noreply@firsthackdallas.com'
	# 		  to       'codyw9524@gmail.com'
	# 		  subject  'testing 1, 2, 3'
	# 		  body     'body stuffs'
	# 		end
	# 		mail.delivery_method :sendmail
	# 		mail.deliver
	# 	end
	# 	redirect_to '/password/recovery/confirmed'
	# end
	# def recover_password_email_sent

	# end

	private
		def user_params
			params.require(:user).permit(
				:first_name,
				:last_name,
				:email,
				:avatar,
				:password,
				:password_confirmation
			)
		end
end
