require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar",
                                         role: "" } }
    end
    assert_template 'users/new'
    assert_select "a[href=?]", signup_path
    follow_redirect!
	assert_template 'users/show'
	assert is_logged_in?
    assert_not flash[:danger]
	get root_path
  	assert flash.empty?
  end
end
