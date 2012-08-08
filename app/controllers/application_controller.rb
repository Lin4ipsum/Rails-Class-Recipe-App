class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :login_required
  
  def login_required
    unless logged_in? 
      redirect_to login_path, :notice => "You must be logged in."
    end
  end
  
  def logged_in?
    current_user ? true : false
  end
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  
  def logout
    session[:user_id] = nil
  end
  

 helper_method :current_user, :logged_in?

end
