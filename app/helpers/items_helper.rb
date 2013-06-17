#This was just playing around with modules and helpers
module ItemsHelper
	def account
		foo = "/users/" + current_user.id
	end
end