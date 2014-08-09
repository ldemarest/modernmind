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

    user_params.each do |k,v|

     userid = v.split(",") 

     userid.uniq.each {|x| @mind.users << User.find(x) if !@mind.users.include?(User.find(x))}

    end
    redirect_to user_path(current_user)
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

  def update
    @mind = Mind.find(params[:id])
  

      if @mind.upvote == nil
        @upvote = Upvote.create(:mind_id => params[:id])
         binding.pry
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

<<<<<<< HEAD

      end

    binding.pry

=======
    if Upvote.users.include?(current_user)
      @upvote.count -= 1
      @upvote.save
    end
>>>>>>> 8c0ffbf4d5a03d88e3b5e5d8837a10c1110f4144

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
