class Reimbursement < ApplicationRecord
  belongs_to :employee_detail


  def self.empoye_reimbursement(id)
    result = Reimbursement.where(:employee_detail_id => id)
    spent=0
    names = []
    if result.present?
          result.each_with_index do |reim,index|
            temp_array = {}
            if index == 0

                temp_array["emp_name"] = reim.employee_detail.emp_name
                temp_array["emp_id"] = reim.employee_detail_id
            end
            temp_array["type"] = reim["nature"]
            temp_array["reason"] = reim["reason"]
            temp_array["cashInHand"] = reim["cashInHand"]
            temp_array["spent_date"] = reim["spent_date"]
            temp_array["spendammount"] = reim["spent"]
            spent = reim["spent"] + spent
            temp_array["remaining"] = reim["cashInHand"]-spent
            index= index  + 1
            names << temp_array
        end
        return names
    end
end




end
