class MindsController < ApplicationController

  def new
    @mind = Mind.new

  
  end

  def index
    @minds = Mind.all

  end

  def create
    @mind = Mind.create(mind_params)
    @mind.neurons.build(:user_id => current_user.id)
    @mind.save
    @user = current_user
    @user.update(:mind_maker => true)
    @user.save

    # @mind.update(:creator_id => current_user.id)
    # neuron = Neuron.create(mind_params[:neuron])
    redirect_to user_path(current_user)
  end

  def show

    @mind = Mind.find(params[:id])
    @neurons = @mind.neurons.last
    @users = @mind.users
    # binding.pry

  end




  private
  
  def mind_params
    params.require(:mind).permit(:name)
  end 



end
