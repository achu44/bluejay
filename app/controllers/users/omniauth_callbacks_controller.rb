class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_filter :authenticate

  def facebook

    omniauth_data = request.env["omniauth.auth"]

    facebook_email = omniauth_data["info"]["email"]

    if User.find_by_email(facebook_email) 

      user = User.find_by_email(facebook_email)
      user.provider = omniauth_data["provider"]
      user.uid = omniauth_data["uid"]
      user.name = omniauth_data["info"]["name"]
      user.photo = omniauth_data["info"]["image"]
      user.access_token = omniauth_data["credentials"]["token"]   

      fb_user = FbGraph::User.me(user.access_token)
      # fb_user = FbGraph::User.new('matake', :access_token => user.access_token)
      fb_user = fb_user.fetch

      user.save

    else
      user = User.from_omniauth(omniauth_data)
    end

    #if user.persisted?
      #flash.notice = "Signed in!" # this wasn't working anyway.
      session[:user_id] = current_user.id #this was copied over from Sessions Controller
      sign_in_and_redirect user
    #else
      #session["devise.user_attributes"] = user.attributes
      #redirect_to new_user_registration_url
    #end
  end
end