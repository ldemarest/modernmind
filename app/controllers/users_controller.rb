class UsersController < ApplicationController

  def show
    @user = current_user
    @mind = Mind.new
    # @minds = Mind.where(:creator_id => current_user.id)
    # @minds = Mind.all
  end

end
