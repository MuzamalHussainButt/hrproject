class CreateOvertimes < ActiveRecord::Migration[5.2]
  def change
    create_table :overtimes do |t|
      t.string :shiftname
      t.bigint :rateperhour
      t.references :employee_detail, foreign_key: true

      t.timestamps
    end
  end
end
