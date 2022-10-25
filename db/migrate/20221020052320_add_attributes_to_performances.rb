class AddAttributesToPerformances < ActiveRecord::Migration[5.2]
  def change
    add_column :performances, :tasktype, :string
    add_column :performances, :taskstatus, :string
    add_column :performances, :recommendations, :string
  end
end
