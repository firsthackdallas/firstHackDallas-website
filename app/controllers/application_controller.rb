class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end
  def require_login
  	redirect_to '/' if session[:user_id] == nil
  end
  def admin
  	Admin.find_by({user_id: session[:user_id]}) if session[:user_id]
  end
  def require_admin
  	redirect_to '/' if ! admin
  end

  helper_method :current_user
  helper_method :admin
end
