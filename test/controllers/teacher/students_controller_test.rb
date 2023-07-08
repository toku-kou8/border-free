require "test_helper"

class Teacher::StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teacher_students_index_url
    assert_response :success
  end

  test "should get show" do
    get teacher_students_show_url
    assert_response :success
  end
end
