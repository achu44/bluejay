class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :authenticate_user!
  before_filter :load_an_item

  # Important!! if you name the below current_user instead of
  #current_user_facebook, it overrides Devise's default
  # current_user and user_sigend_in? helper methods, which screws up a ton.
  # Not being able to keep track if the user is logged in or not, etc.

  def load_an_item
      @item = Item.new
      if user_signed_in?
        @item = current_user.items.build
        @item.user_id = current_user.id 
      end
  end 

  def current_user_facebook
    session[:user_id]
   # @current_user ||= User.find(session[:user_id]) 
  end
  #if session["warden.user.user.key"] 
    #@current_user = User.find_by_email() 
  #end
  helper_method :current_user_facebook

  private

  def after_sign_in_path_for(user)
  	items_path
  end

  def after_sign_out_path_for(user)
  	items_path
  end
  
end
