require 'test_helper'

class WellcomePagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "JEANS APP"
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get wellcome_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get wellcome_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
end
