class AddAttributesToEmployeeDetail < ActiveRecord::Migration[5.2]
  def change
    remove_column :employee_details, :date_of_brith
    add_column :employee_details, :dateOfBrith, :date
  end
end
