class EmployeeAttendanceController < ApplicationController
  def index
       @employee_attendance = EmployeeAttendance.find_attendances(params[:id])
  end
  

end


