class MindsController < ApplicationController
  before_action :show, only: [:show, :update, :destroy, :email]
  # autocomplete :users, :name

  def new
    @mind = Mind.new

  end

  def index
    @minds = Mind.all

  end

  def create
    # binding.pry
    @user = current_user
    @mind = Mind.create(mind_params)
    @mind.user_minds.build(:user_id => current_user.id)
    @mind.save

    respond_to do |format|
      if @mind.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to(user_path(current_user), notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @mind = Mind.find(params[:id])

    if (!@mind.users.include?(current_user) && @mind.public == false)

      redirect_to error_path

    else

      @lastneuron = @mind.neurons.last

      @neurons = @mind.neurons

      if @neurons.size >= 4
        redirect_to completedmind_path
      end

    end
  end

  def completedmind

    @mind = Mind.find(params[:id])
    @neurons = @mind.neurons

  end


  private

  def mind_params
    params.require(:mind).permit(:name,:public)
  end


end
