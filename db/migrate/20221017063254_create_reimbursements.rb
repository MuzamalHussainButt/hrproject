class CreateReimbursements < ActiveRecord::Migration[5.2]
  def change
    create_table :reimbursements do |t|
      t.string :types
      t.bigint :amount
      t.string :reason
      t.string :spent_date
      t.references :employee_detail, foreign_key: true

      t.timestamps
    end
  end
end
