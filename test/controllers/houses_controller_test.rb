require 'test_helper'

class HousesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get listing_path
    assert_response :success
    assert_select "title", "House Listing | #{@base_title}"
  end

  # test "should get " do
  #   get listing_path
  #   assert_response :success
  #   assert_select "title", "House Listing | #{@base_title}"
  # end

end
