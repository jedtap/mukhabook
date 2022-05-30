class WelcomeMailer < ApplicationMailer
  def welcome_email
    @email = params[:email]
    @name = params[:name]
    
    mail(
      to: @email,
      subject: "Big welcome to Mukhabook"
    )
  end
end
