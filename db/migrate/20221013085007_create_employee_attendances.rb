class CreateEmployeeAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_attendances do |t|
      t.string :status
      t.references :employee_detail, foreign_key: true

      t.timestamps
    end
  end
end
