class AdminsController < ApplicationController
	def index
		@users = User.all
		@teams = Team.all
		@admins = Admin.all
	end
end