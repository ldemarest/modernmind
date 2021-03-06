class MindsController < ApplicationController

  before_action :require_login, only: [:create, :update, :show]


  def new
    @mind = Mind.new

  end


  def index
    @minds = Mind.all

  end


  def create
    if Mind.all.length == 0
      @user = current_user
    else
      @user = initial_emails
    end
    @mind = Mind.create(mind_params)
    @mind.user_minds.build(:user_id => current_user.id)
    @mind.save
    upvote = Upvote.create(:mind_id => @mind.id)
    upvote.save



    user_params.each do |k,v|

      userid = v.split(",")

      userid.uniq.each {|x| @mind.users << User.find(x) if !@mind.users.include?(User.find(x))}

    end



    respond_to do |format|
      if @mind.save
        # Tell the UserMailer to send a welcome email after save
        # UserMailer.new_mind(@user).deliver
        format.html { redirect_to(user_path(current_user)) }
        format.json { render json: @user, status: :created, location: @user }
        format.js
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
    @user = neuron_emails
    @mind = Mind.find(params[:id])
    @neurons = @mind.neurons
    @upvote = @mind.upvote
    # if @mind = @mind
    #   UserMailer.mind_completed(@user).deliver
    # end
  end


  def update

    @mind = Mind.find(params[:id])
    @upvotes = @mind.upvote

    if @mind.upvote == nil
      @upvote = Upvote.create(:mind_id => params[:id])
      count =  @upvote.count += 1
      @upvote.update(:count => count)
      @upvote.users << current_user

    elsif (@mind.upvote != nil && !@mind.upvote.users.include?(current_user))
      count = @mind.upvote.count += 1
      @mind.upvote.update(:count => count)
      @mind.upvote.users << current_user

    elsif @mind.upvote.users.include?(current_user)
      count = @mind.upvote.count -= 1
      @mind.upvote.update(:count => count)
      @mind.upvote.users.delete(current_user)
    end

    respond_to do |format|
      format.html
      format.js
    end

  end



  def initial_emails
    @emails = []

    if Mind.all.last.users.exists?
      Mind.all.last.users.each do |user|
        @emails << user.email
      end
    else
      @email << current_user.email
    end
    @emails
  end

  def neuron_emails
    @emails = []
    @user_ids = []
    @mind = Mind.find(params[:id])
    @neurons = @mind.neurons
    @neurons.each do |user|
      @user_ids << UserMind.find(user.user_mind_id).user_id
    end
    @user_ids.each do |id|
      @emails << User.find(id).email
    end
    @emails
  end

  private

  def mind_params
    params.require(:mind).permit(:name,:public)
  end

  def user_params
    params.require(:mind).permit(:user_tokens)
  end

  def upvote_params
    params.require(:mind).permit(:mind_id)
  end

end
