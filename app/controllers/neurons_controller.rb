class NeuronsController < ApplicationController
  def index
    @neurons = Neuron.all
  end

  def create

    respond_to do |format|
      format.js render :text => "hello"
    end

    @neuron = Neuron.new(image: params[:image])
    respond_to do |format|
      if @neuron.save
        format.json { render json: @neuron}
      else
        format.json { render json: "Error", status: :unprocessable_entity }
      end
    end
  end

  def zip
    @neuron = Neuron.find(7).image
  end

  private


  def neuron_params
    params.require(:neuron).permit(:contributor_id, :name, :id, :image)
  end
  
end
