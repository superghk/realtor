class HousesController < ApplicationController
  def show
  	@house = House.find(params[:id])
  end

  def new
  	
  	@house = House.new
  end

  

  def create
  	@house = House.new(house_params)
  	if @house.save
  		
  		flash.now[:success] = "Successfully create a house listing!"
  		redirect_to @house
  	else
  		flash.now[:danger] = "Sorry failedd creating a house listing"
  	end
  end

  def edit
  	@house = House.find(params[:id])
  end

  def update
  	@house = House.find(params[:id])
  	if @house.update_attributes(house_params)
  		flash.now[:success] = "Your changes have been successfully saved!"
  		redirect_to @house
  	else
  		flash.now[:danger] = "Sorry your changes have not been saved."
  		render 'edit'
  	end
  end

  	private

  	def house_params
  		params.require(:house).permit(:house_type, :bathroom, :room, :price, :description)
  	end

end
