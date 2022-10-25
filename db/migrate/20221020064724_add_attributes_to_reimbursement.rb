class AddAttributesToReimbursement < ActiveRecord::Migration[5.2]
  def change
    add_column :reimbursements, :spent, :bigint
    add_column :reimbursements, :cashInHand, :bigint
    add_column :reimbursements, :nature, :string
   
    remove_column :reimbursements, :types
    remove_column :reimbursements, :amount

  end
end
