class NeuronsController < ApplicationController
  def index
    @neurons = Neuron.all
  end

  def create

    @neuron = Neuron.new(neuron_params)
    # @neuron.user_mind = current_user.id
    @user_mind = UserMind.find_by_user_id_and_mind_id(current_user.id, user_mind_params[:mind_id]) || UserMind.create(:user_id => current_user.id, :mind_id => user_mind_params[:mind_id])
    # @user_mind.user_id = current_user.id
    @neuron.user_mind_id = @user_mind.id

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

      params.require(:neuron).permit(:name, :image)

    end

    def user_mind_params

      params.require(:user_mind).permit(:mind_id)
    end
  
end
