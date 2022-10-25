require 'test_helper'

class EmployeeAttendanceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_attendance_index_url
    assert_response :success
  end

end
