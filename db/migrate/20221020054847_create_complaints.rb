class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.string :query
      t.string :query_status
      t.references :employee_detail, foreign_key: true

      t.timestamps
    end
  end
end
