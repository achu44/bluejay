class ContactController < ApplicationController

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(params[:message])
		@user = User.find(current_user.id)

		if @message.valid?
			UserMailer.new_message(@message, @user).deliver
			redirect_to('/main', :notice => "Message was successfully sent.")
		else
			flash.now.alert = "Please fill all fields."
			render :new
		end
	end
end
