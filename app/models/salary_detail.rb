class SalaryDetail < ApplicationRecord
  belongs_to :employee_detail
  

  def self.get_average_salary
		return SalaryDetail.average(:salary).to_f
	end

  def self.get_salary(id)
    
  	return SalaryDetail.find_by(:employee_detail_id => id).salary
  end
  def self.high_paid(limit=10)
  	names = []
  	SalaryDetail.order("salary DESC").limit(limit.to_i).each do |sal|
  		temp_array = {}
      temp_array["ename"] = sal.employee_detail.emp_name
      temp_array["salary"] = sal.salary
      temp_array["id"] = sal.employee_detail_id
      temp_array["bankname"] = sal.employee_detail.bank_name
      temp_array["accounttype"] = sal.employee_detail.account_type
      temp_array["accountnumber"] = sal.employee_detail.account_number
      names << temp_array
  	end
  	return names.uniq
  end

end
