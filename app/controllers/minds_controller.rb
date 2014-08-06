class MindsController < ApplicationController

  def new
    @mind = Mind.new

  
  end

  def index
    @minds = Mind.all

  end

  def create
    
    @mind = Mind.create(mind_params)
    @mind.update(:creator_id => current_user.id)

    # neuron = Neuron.create(mind_params[:neuron])
    redirect_to user_path(current_user)
  end

  def show
<<<<<<< HEAD
  

=======
    @mind = Mind.find_by(params[:id])
>>>>>>> a1c36bf0549dfeb825270f93103b87edf7d60b5b

  end




  private
  
  def mind_params
    params.require(:mind).permit(:name)
  end 



end
