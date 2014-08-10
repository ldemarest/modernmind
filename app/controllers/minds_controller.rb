class MindsController < ApplicationController

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

    user_params.each do |k,v|

      userid = v.split(",")

      userid.uniq.each {|x| @mind.users << User.find(x) if !@mind.users.include?(User.find(x))}

    end

    respond_to do |format|
      if @mind.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to(user_path(current_user), notice: 'User was successfully created.') }
        # format.json { render json: @user, status: :created, location: @user }
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
    @upvote = @mind.upvote

    

  end

  def update
    
    @mind = Mind.find(params[:id])
    @upvotes = @mind.upvote

      if @mind.upvote == nil
        @upvote = Upvote.create(:mind_id => params[:id])
        @count =  @upvote.count += 1 
        @upvote.update(:count => @count)
        @upvote.users << current_user

      elsif (@mind.upvote != nil && !@mind.upvote.users.include?(current_user))
        @count = @mind.upvote.count += 1 
        @mind.upvote.update(:count => @count)
        @mind.upvote.users << current_user


      elsif @mind.upvote.users.include?(current_user)
        @count = @mind.upvote.count -= 1 
        @mind.upvote.update(:count => @count)
        @mind.upvote.users.delete(current_user)
      end

      respond_to do |format|
        format.html {render text: "working"}
        format.js
      end
  
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
