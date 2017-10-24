class ListingsController < ApplicationController
	def index
   		
  	end
  	def show
  		@houses = current_user.houses
 	end
end
