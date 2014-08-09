class UserMailer < ActionMailer::Base
  # default to: Proc.new { Mind.last.users.pluck(:email)},
  default from: "demarest.luke@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000'
    email_with_name = "#{@user.name} <#{@user.email}>"
    mail(to: email_gatherer,
         content_type: "text/html",
         subject: 'Make Up Your Mind')
    email_gatherer
  end

  def email_gatherer
    @emails = []
    Mind.all.last.users.each do |user|
      @emails << user.email
    end
    @emails

  end

end
