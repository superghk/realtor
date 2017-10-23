require 'test_helper'

class HouseTest < ActiveSupport::TestCase
  
  def setup
  	@house = House.new(house_type: "Detached", bathroom: 1, room: 1, price: 100000, description: "Basement is finished" )
  end

  def "should be valid" do
  	assert @house.valid?
  end

  test "house type should be present" do
  	@house.type = ""
  	assert_not @house.valid?
  end

  test "bathroom should be present or 0" do
  	@house.bathroom = "" || @house.bathroom = 0
  	assert_not @house.valid?
  end

  test "bathroom number should be numerical" do
  	@house.bathroom = "text"
  	assert_not @house.valid?
  end

  test "room should be present or 0" do
  	@house.room = "" || @house.room = 0
  	assert_not @house.valid?
  end

  test "room number should be numerical" do
  	@house.room = "text"
  	assert_not @house.valid?
  end

  test "price should be present or 0" do
  	@house.price = "" || @house.price = 0
  	assert_not @house.valid?

  end

  test "price number should be numerical" do
  	@house.price = "text"
  	assert_not @house.valid?
  end

 
end
