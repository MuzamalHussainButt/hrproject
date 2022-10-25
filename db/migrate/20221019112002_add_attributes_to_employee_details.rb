class AddAttributesToEmployeeDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :employee_details,  :bank_name,        :string
    add_column :employee_details,  :account_type,     :string
    add_column :employee_details,  :account_number,   :string
    add_column :employee_details,  :phone_number,     :string
    add_column :employee_details,  :cnic_number,      :string
    add_column :employee_details,  :date_of_brith,    :string
    add_column :employee_details,  :designation,      :string
    add_column :employee_details,  :other_allowance,  :string
    add_column :employee_details,  :conveyance,       :string


  end
end
