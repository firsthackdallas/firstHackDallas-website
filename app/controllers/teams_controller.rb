class TeamsController < ApplicationController
	before_action :require_login
	def index
		@teams = Team.where(event: Event.last)
		@users = User.all
	end
	def create
		user_count = User.count - Admin.count
		if user_count < 75
			team = Team.new(team_params)
			if team.save
					user = User.find(session[:user_id])
					user[:team_id] = team.id if user
					user.save
			else
				flash[:errors] = team.errors.full_messages
			end
		else
			flash[:user_count_error] = "We have reached our hacker capacity and are not accepting new teams at this time."
		end
		redirect_to '/teams'
	end
	def destroy
		Team.destroy(params[:id])
		redirect_to '/admins/dashboard'
	end

	private
		def team_params
			params.require(:team).permit(:name, :avatar)
		end
end