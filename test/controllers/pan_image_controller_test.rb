require "test_helper"

class PanImageControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pan_image_new_url
    assert_response :success
  end

  test "should get index" do
    get pan_image_index_url
    assert_response :success
  end

  test "should get show" do
    get pan_image_show_url
    assert_response :success
  end

  test "should get delete" do
    get pan_image_delete_url
    assert_response :success
  end
end
