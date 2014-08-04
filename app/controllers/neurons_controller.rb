class NeuronsController < ApplicationController
  def index
    @neurons = Neuron.all
  end

  def create
    binding.pry
    # @user = User.find(session[:user_id]) if session[:user_id]

    # unless @user.neurons.find_by(neuron: params[:id])
    #   @neuron = Neuron.create(neuron_params) 
    #   @user.neurons << @neruon
    # end
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
    @neuron = Neuron.all.first.image

  end

  private

  def neuron_params
    params.require(:neuron).permit(:contributor_id, :name, :id, :image)
  end 



end
