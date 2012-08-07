class SessionsController < ApplicationController
 skip_before_filter :login_required, :only => [:new, :create]
 
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
     session.destroy
      redirect_to login_path, :notice => "You are succesfully logged out."
  end
  


end
