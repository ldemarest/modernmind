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
    neuron = Neuron.create(mind_params[:neuron])
    redirect_to index


  end



  private
  
  def mind_params
    params.require(:mind).permit(:name)
  end 



end
