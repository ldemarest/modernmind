class NeuronsController < ApplicationController
  def index
    @neurons = Neuron.all
  end

  def create


    @neuron = Neuron.new(neuron_params)
    @neuron.update(:user_id => current_user.id)
    @neuron.save

   


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

    params.require(:neuron).permit(:name, :image, :mind_id)

  end
  
end
