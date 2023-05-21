require "test_helper"

class Student::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_reservations_index_url
    assert_response :success
  end

  test "should get create" do
    get student_reservations_create_url
    assert_response :success
  end

  test "should get update" do
    get student_reservations_update_url
    assert_response :success
  end
end
