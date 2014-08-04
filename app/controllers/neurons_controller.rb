class NeuronsController < ApplicationController
  def index
    @neurons = Neuron.all
  end

  def create

  end
end
