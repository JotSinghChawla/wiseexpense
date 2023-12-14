require "test_helper"

class WiseuserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wiseuser_new_url
    assert_response :success
  end

  test "should get create" do
    get wiseuser_create_url
    assert_response :success
  end
end
