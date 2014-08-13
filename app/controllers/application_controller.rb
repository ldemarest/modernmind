class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :require_login
 
  private
 
  def require_login
    unless logged_in?
      redirect_to root_url
      flash[:notice] = "You must be logged in to access this section."
      flash.keep(:notice)
    end
  end

  helper_method def logged_in?
    !!current_user
  end
 
  helper_method def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      session[:user_id] = nil
    end
  end

  
  
  
end
