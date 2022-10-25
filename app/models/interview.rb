class Interview < ApplicationRecord
  belongs_to :employee_detail

  has_one_attached :file

  def self.getInterview(interviewee_name)
    
    result = Interview.where(:name => interviewee_name)
    if result.present?
      names = []
      result.each_with_index do |rslt|
          temp_arr = {}
          temp_arr["name"]=rslt["name"]
          temp_arr["title"]=rslt["title"]
          temp_arr["description"]=rslt["description"]
          temp_arr["employee_detail"]=rslt["employee_detail_id"]
          names << temp_arr
      end
      return names
    end

    
  end

end
