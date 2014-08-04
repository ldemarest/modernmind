class NeuronsController < ApplicationController
  def index
    @neurons = Neuron.all
  end

  def create
    respond_to do |format|
      format.js render :text => "hello"
    end

  end
  
end
