class Overtime < ApplicationRecord
  belongs_to :employee_detail


  def self.extratime(id)
    result= Overtime.where(:employee_detail_id => id)
    names = []
    if result.present?
      result.each_with_index do |e,i|
        temp_array = {}
        if i==0
          temp_array["emp_name"] = e.employee_detail.emp_name
          temp_array["emp_id"] = e.employee_detail_id
        end
          if i%2==0
          temp_array["day"] = e.created_at.strftime("%D")
          temp_array["shift"] = e["shiftname"]
          temp_array["perhour"] = e["rateperhour"]
          temp_array["overtime"] = EmployeeAttendance.overTime(e.employee_detail_id,e.created_at)
          i=i+1
          names << temp_array
          end
      end
      return names
    end

  end



  







end
