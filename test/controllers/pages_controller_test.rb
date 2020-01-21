require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get privacy_cookie_policy" do
    get events_privacy_cookie_policy_url
    assert_response :success
  end
end
