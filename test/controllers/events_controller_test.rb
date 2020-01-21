require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get events_index_url
    assert_response :success
  end

  test "should get show" do
    get events_show_url
    assert_response :success
  end

  test "should get new" do
    get events_new_url
    assert_response :success
  end

  test "should get edit" do
    get events_edit_url
    assert_response :success
  end

  test "should get missing_out" do
    get events_missing_out_url
    assert_response :success
  end

  test "should get club_futuro_vol_1_the_exhibition" do
    get events_club_futuro_vol_1_the_exhibition_url
    assert_response :success
  end

end
