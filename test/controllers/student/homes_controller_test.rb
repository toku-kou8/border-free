require "test_helper"

class Student::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_homes_index_url
    assert_response :success
  end

  test "should get edit" do
    get student_homes_edit_url
    assert_response :success
  end

  test "should get update" do
    get student_homes_update_url
    assert_response :success
  end
end
