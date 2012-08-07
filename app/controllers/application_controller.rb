class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :login_required
  after_filter :clean_cache, :only => [:destroy]
  
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
  
  def clean_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

 helper_method :current_user, :logged_in?

end
