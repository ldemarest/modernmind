class MindsController < ApplicationController

  def new
    @mind = Mind.new

  
  end

  def index
    @minds = Mind.all

  end

  def create
    binding.pry
    @mind = Mind.create(mind_params)
    @mind.user_minds.build(:user_id => current_user.id)
    @mind.save
    # @user = current_user
    # @user.update(:mind_maker => true)
    # @user.save
    # @first_user = @mind.users.first
    # @first_user.update(:mind_maker => true)
    # binding.pry
    # @first_user.save

    # @mind.update(:creator_id => current_user.id)
    # neuron = Neuron.create(mind_params[:neuron])
    redirect_to user_path(current_user)
  end

  def show
     @mind = Mind.find(params[:id])

    if (!@mind.users.include?(current_user) && @mind.public == false)

      redirect_to error_path

    else
 
   

    @lastneuron = @mind.neurons.last

    @neurons = @mind.neurons 
     
    if @neurons.size >= 4
      redirect_to completedmind_path
    end
end
  end

  def completedmind
    
    @mind = Mind.find(params[:id])
    @neurons = @mind.neurons

  end


  private
  
  def mind_params
    params.require(:mind).permit(:name,:public)
  end 




end
