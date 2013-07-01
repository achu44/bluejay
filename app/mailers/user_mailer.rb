class UserMailer < ActionMailer::Base

default :from => "noreply@theharvardlist.com", :content_type => "text/html"

  def registration_confirmation(user)
  		mail(:to => user.email, :subject => "Thanks for signing up!", :from => "notifications@theharvardlist.com")
  end

  def new_message(message, user) #http://matharvard.ca/posts/2011/aug/22/contact-form-in-rails-3/
  	@message = message
  	@user = user
  	mail(to: @user.email, subject: @message.subject)
  end

end