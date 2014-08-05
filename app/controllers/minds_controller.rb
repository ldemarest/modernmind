class MindsController < ApplicationController

  def new
    @mind = Mind.new
  end

  def index
    @minds = Mind.all

  end

  def create
    @mind = Mind.create(mind_params)
    binding.pry
    redirect_to index

  end



  private
  
  def mind_params
    params.require(:mind).permit( :name)
  end 



end
