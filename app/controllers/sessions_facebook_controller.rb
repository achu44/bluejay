class SessionsFacebookController < ApplicationController
	def create
    	user = User.from_omniauth(env["omniauth.auth"])
    	session[:user_id] = user.id
    	redirect_to '/main'
  	end

  	def destroy
    	session[:user_id] = nil
      reset_session
    	redirect_to '/main'
  	end
end
