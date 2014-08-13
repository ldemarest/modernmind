class SessionsController < ApplicationController

  before_action :require_login, only: :show
  # before_action :require_login, except: :create

  def create
    auth = request.env["omniauth.auth"]     
    user = User.find_by_provider_and_uid(auth[:provider], auth[:uid]) || User.create_from_omniauth(auth)     
    session[:user_id] = user.id  
    redirect_to user_path(current_user), :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
