class UsersController < ApplicationController

  before_action :require_login, only: :show
  # before_action :require_login, except: :index

  def show
    @user = current_user
    @mind = Mind.new
    @complete = @user.complete_minds
    @incomplete = @user.incomplete_minds
  end

  def index
    @users = User.where("name like ?","%#{params[:q]}%")

  end

end
