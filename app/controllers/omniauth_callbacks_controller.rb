class OmniauthCallbacksController < ApplicationController
  def google

		@user = User.from_omniauth(request.env["omniauth.auth"])
          
    prof = Profile.new
    prof.name = @user.name
    prof.user_id = @user.id
    prof.save

		sign_in_and_redirect @user

    # user = User.from_omniauth(env["omniauth.auth"])
    # session[:user_id] = user.id
    # redirect_to root_path, notice: "Login successful!"

    # acc = Current.user.google_accounts.where(email: auth.info.email).first_or_initialize
    # acc.update(
    #   name: auth.info.first_name,
    #   token: auth.credentials.token
    # )

    # redirect_to root_path, notice: "Login successful!"
  end

  # def auth
  #   request.env["omniauth.auth"]
  # end


end