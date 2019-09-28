require 'test_helper'

class WellcomePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get wellcome_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get wellcome_pages_help_url
    assert_response :success
  end

end
