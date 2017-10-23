require 'test_helper'

class HousesAddTest < ActionDispatch::IntegrationTest
  test "invalid adding information" do
    get addlistings_path
    assert_no_difference 'House.count' do
      post users_path, params: { user: { house_type:  "",
                                         bathroom: "",
                                         room:  "",
                                         price: ""} }
    end
    assert_template 'houses/new'
    assert_select "a[href=?]", addlistings_path
    follow_redirect!
	assert_template 'houses/show'
	assert does_have_houses?
    assert_not flash[:danger]
	get root_path
  	assert flash.empty?
  end
end
