class NeuronsController < ApplicationController
  def index
    @neurons = Neuron.all
  end

  def create

    binding.pry

    @neuron = Neuron.new(neuron_params)
    @neuron.save
    @neuron.update(:user_id => current_user.id)


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

    params.require(:neuron).permit(:name, :id, :image, :mind_id, :user_id)

  end
  
end
