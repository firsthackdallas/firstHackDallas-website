class AdminsController < ApplicationController
	before_action :require_admin
	def index
		admins = Admin.joins(:user).pluck('user_id')
		waitlist = WaitList.joins(:user).pluck('user_id')
		@users = User.all.where.not(id: admins).where.not(id: waitlist)
		@teams = Team.all
		@admins = Admin.all
		@wait_list = WaitList.all
	end
end