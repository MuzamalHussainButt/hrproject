class Complaint < ApplicationRecord
  belongs_to :employee_detail

  def self.findComplaints(id)
    result = Complaint.where(:employee_detail_id => id)
    names = []
    result.each_with_index do |rslt,index|
      temp_arr = {}
      temp_arr["emp_query"] = rslt["query"]
      temp_arr["query_status"] = rslt["query_status"]
      if index%2 ==0
        temp_arr["emp_id"] = rslt.employee_detail_id
        temp_arr["emp_name"] = rslt.employee_detail.emp_name
      index = index + 1
      end
      names << temp_arr
    end
    return names
  end
end
