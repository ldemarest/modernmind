class NeuronsController < ApplicationController
  before_action :set_neuron, only: [:show, :edit, :update, :destroy]

  # GET /neurons
  # GET /neurons.json
  def index
    @neurons = Neuron.all
  end

  # GET /neurons/1
  # GET /neurons/1.json
  def show
  end

  # GET /neurons/new
  def new
    @neuron = Neuron.new
  end

  # GET /neurons/1/edit
  def edit
  end

  # POST /neurons
  # POST /neurons.json
  def create
    @neuron = Neuron.new(neuron_params)

    respond_to do |format|
      if @neuron.save
        format.html { redirect_to @neuron, notice: 'Neuron was successfully created.' }
        format.json { render :show, status: :created, location: @neuron }
      else
        format.html { render :new }
        format.json { render json: @neuron.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /neurons/1
  # PATCH/PUT /neurons/1.json
  def update
    respond_to do |format|
      if @neuron.update(neuron_params)
        format.html { redirect_to @neuron, notice: 'Neuron was successfully updated.' }
        format.json { render :show, status: :ok, location: @neuron }
      else
        format.html { render :edit }
        format.json { render json: @neuron.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neurons/1
  # DELETE /neurons/1.json
  def destroy
    @neuron.destroy
    respond_to do |format|
      format.html { redirect_to neurons_url, notice: 'Neuron was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neuron
      @neuron = Neuron.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def neuron_params
      params.require(:neuron).permit(:name)
    end
end
