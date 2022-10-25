class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.string :title
      t.text :description
      t.string :name
      t.references :employee_detail, foreign_key: true

      t.timestamps
    end
  end
end
