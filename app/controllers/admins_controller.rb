class AdminsController < ApplicationController
	def index
		@users = User.all
		@teams = Team.all
	end
end