require "test_helper"

class Student::ClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_classes_index_url
    assert_response :success
  end

  test "should get create" do
    get student_classes_create_url
    assert_response :success
  end

  test "should get show" do
    get student_classes_show_url
    assert_response :success
  end

  test "should get update" do
    get student_classes_update_url
    assert_response :success
  end
end
