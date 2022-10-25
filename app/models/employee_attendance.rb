class EmployeeAttendance < ApplicationRecord
  belongs_to :employee_detail



  def self.find_attendances (id)
    result = EmployeeAttendance.where(:employee_detail_id => id)
    n=0
    names = []
    if result.present?
        result.each_with_index do |employee,index|
        if index%2 == 0
          temp_array = {}
          temp_array["Time"]=officeTime(employee.employee_detail_id,employee.created_at)
          if temp_array["Time"]!="off"
            temp_array["PunchOutTime"]=punchoutTime(employee.employee_detail_id,employee.created_at)
            temp_array["PunchInTime"]=punchinTime(employee.employee_detail_id,employee.created_at)
            temp_array["Date"]=employee.created_at.strftime("%D")
            if n == 0
            temp_array["ename"] = employee.employee_detail.emp_name
            temp_array["id"] = employee.employee_detail_id
            n=n+1
            end
              names << temp_array
          end
        end
      end
      return names
    end
  end







































  def self.timezone(id=nill,cur_day)
    dd = cur_day.strftime("%d").to_i
    a = Date.today  - 1 - dd
    return a.strftime("%A")
  end
  def self.overTime(id=nil,cur_day=nil)
    a=timezone(id,cur_day)
    if a == "Sunday" or a == "Saturday"

      ar = sat_sun_punchin(id,cur_day)
      ex = sat_sun_punchout(id,cur_day)
      total = (ex - ar)/3600.to_f
      return total
    end
  end
  def self.sat_sun_punchin(id,temp)
    cur_month = Date.today.strftime("%m")
    cre_month = temp.strftime("%m")
    if cur_month == cre_month
        check_in  =  EmployeeAttendance.where(employee_detail_id: id, status: "punch-in",created_at: temp)
        if check_in.present?
          return check_in.first.created_at
        end
    end
  end
  def self.sat_sun_punchout(id,temp)
    cur_month = Date.today.strftime("%m")
    cre_month = temp.strftime("%m")
    if cur_month == cre_month
        b = temp.strftime("%d").to_i
        check_out  =  EmployeeAttendance.where(employee_detail_id: id, status: "punch-out")
        if check_out.present?
          check_out.each do |x|
            a = x.created_at.strftime("%d").to_i
            if a==b
              return x.created_at
            end
          end
        end
    end
  end
  def self.punchoutTime(id=nil,temp=nil,check=nil)
    cur_month = Date.today.strftime("%m")
    cre_month = temp.strftime("%m")
    if cur_month == cre_month
        tz = timezone(id,temp)
        if tz != "Sunday" and tz!= "Saturday"
          b = temp.strftime("%d").to_i
          check_out  =  EmployeeAttendance.where(employee_detail_id: id, status: "punch-out")
          if check_out.present?
            check_out.each do |x|
              a = x.created_at.strftime("%d").to_i
              if a==b and check==nil
                return x.created_at.strftime("%H:%M:%S")
              end
              if a==b and check==1
                return x.created_at
              end
            end
          end
        end
    end
    return "off"
  end


  def self.punchinTime(id=nil,temp=nil,check=nil)
    cur_month = Date.today.strftime("%m")
    cre_month = temp.strftime("%m")
    if cur_month == cre_month
        check_in  =  EmployeeAttendance.where(employee_detail_id: id, status: "punch-in",created_at: temp)
        tz = timezone(id,temp)
        if tz!="Saturday" and tz!="Sunday"
          if check_in.present? and check==nil
            arrivaltime = check_in.first.created_at
            return arrivaltime.strftime("%H:%M:%S")
          end
          if check_in.present? and check==1
            return check_in.first.created_at
          end
        end
    end
    return "off"
  end

  def self.officeTime(id=nil,temp=nil)
    check= 1
    ar=punchinTime(id,temp,check)
    ex=punchoutTime(id,temp,check)
    if ar=="off" or ex=="off"
      return ar
    end
    total = (ex - ar)/3600.to_f
    return total
  end

  def self.time_(id=nil)
    check_in  =  EmployeeAttendance.where(employee_detail_id: id, status: "punch-in")
    check_out =  EmployeeAttendance.where(employee_detail_id: id, status: "punch-out")
    arrivaltime = check_in.first.created_at
    if check_out.present?
      exittime= check_out.first.created_at
      time = ((((exittime - arrivaltime).to_f)/60)/60)
      if time >= 6
        return "full day"
      end
      return "half day"
    end
  else
    return "NO CHECK-OUT"
  end

end
