class TeamsController < ApplicationController
	def index
		@teams = Team.all
	end
	def create
		team = Team.new(team_params)
		flash[:errors] = team.errors.full_messages unless team.save
		redirect_to '/teams'
	end

	private
		def team_params
			params.require(:team).permit(:name, :avatar)
		end
end