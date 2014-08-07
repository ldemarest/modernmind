class UsersController < ApplicationController

  def show
    @user = current_user
    @mind = Mind.new
  end

end
