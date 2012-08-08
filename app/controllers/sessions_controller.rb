class SessionsController < ApplicationController
 skip_before_filter :login_required, :only => [:new, :create]
 after_filter :clean_cache, :only => [:destroy]
 
  def new
    render "/login"
  end
  
  def create 
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to recipes_path, :notice => "You have successfully logged in."
    else
      redirect_to login_path, :notice => "Login was invalid. Please try again."
    end
  end
     
  def destroy
     logout
     redirect_to login_path, :notice => "You are succesfully logged out."
  end
  
  def clean_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end


end
