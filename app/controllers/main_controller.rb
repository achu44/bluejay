class MainController < ApplicationController

	#before_filter :authenticate_user!, :except => :home

	layout 'application', :except => :home

	def home
		render :layout => "frontpage"
	end

	def main
		
	end

	def how_it_works
	end

	def contact
	end

	def about
	end

	def login
	end

	def internal
	end

end
