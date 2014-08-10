class UserMailer < ActionMailer::Base
  # default to: Proc.new { Mind.last.users.pluck(:email)},
  default from: "demarest.luke@gmail.com"

  def new_mind(initial_emails)
    
    @user = initial_emails
    @url  = 'http://localhost:3000"'
    mail(to: initial_emails,
         subject: 'Make Up Your Mind')
    initial_emails
  end

  
  def mind_completed(neuron_emails)
    @user = neuron_emails
    @url  = 'http://localhost:3000'
    mail(to: neuron_emails,
         subject: 'Make Up Your Mind')
    neuron_emails
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
