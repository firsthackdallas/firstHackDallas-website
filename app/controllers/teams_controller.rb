class TeamsController < ApplicationController
	def index
		@teams = Team.all
		@users = User.all
	end
	def create
		team = Team.new(team_params)
		if team.save
				user = User.find(session[:user_id])
				user[:team_id] = team.id if user
				user.save
		else
			flash[:errors] = team.errors.full_messages
		end
		redirect_to '/teams'
	end

	private
		def team_params
			params.require(:team).permit(:name, :avatar)
		end
end