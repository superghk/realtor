require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         ""
    assert_equal full_title("Help"), FILL_IN
  end
end