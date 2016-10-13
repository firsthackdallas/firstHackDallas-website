class AdminsController < ApplicationController
	before_action :require_admin
	def index
		@users = User.all
		@teams = Team.all
		@admins = Admin.all
		@wait_list = WaitList.all
	end
end