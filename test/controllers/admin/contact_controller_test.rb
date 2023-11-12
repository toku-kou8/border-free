require "test_helper"

class Admin::ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_contact_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_contact_show_url
    assert_response :success
  end
end
