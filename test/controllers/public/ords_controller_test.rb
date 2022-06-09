require "test_helper"

class Public::OrdsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_ords_new_url
    assert_response :success
  end

  test "should get confirm" do
    get public_ords_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get public_ords_complete_url
    assert_response :success
  end

  test "should get index" do
    get public_ords_index_url
    assert_response :success
  end

  test "should get show" do
    get public_ords_show_url
    assert_response :success
  end
end
