require 'test_helper'

class HousesEditTest < ActionDispatch::IntegrationTest

  def setup
    @house = houses(:house1)
  end

  test "unsuccessful edit" do
  	log_in_as(@user)
    get edit_house_path(@house)
    assert_template 'houses/edit'
    patch house_path(@house), params: { house: { house_type: "", 
    	bathroom: "", 
    	room: "", 
    	price: ""} }

    assert_template 'houses/edit'
  end

   test "successful edit" do
   	log_in_as(@user)
    get edit_house_path(@house)
    assert_template 'houses/edit'
    type  = "Detached"
    bathroom = 1
    room = 1
    price = 100000
    description = "Basement is finished"
    patch user_path(@user), params: { house: { house_type: type, 
    	bathroom: bathroom, 
    	room: room, 
    	price: price, 
    	description: description } }
    assert_not flash.empty?
    assert_redirected_to @house
    @house.reload
    assert_equal type,  @house.type
    assert_equal bathroom, @house.bathroom
    assert_equal room, @house.room
    assert_equal price, @house.price
    assert_equal description, @house.description
  end

   test "should redirect edit when doesn't have lisitings" do
    get edit_user_path(@house)
    assert_not flash.empty?
    assert_redirected_to addlistings_url
  end

  test "should redirect update when doesn't have listings" do
    patch house_path(@house), params: { house: { { house_type: @house.type, 
    	bathroom: @house.bathroom, 
    	room: @house.room, 
    	price: @house.price, 
    	description: @house.description } }
    assert_not flash.empty?
    assert_redirected_to addlistings_url
  end
end
