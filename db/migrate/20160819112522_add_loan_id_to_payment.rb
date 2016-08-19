class AddLoanIdToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :loan_id, :integer
  end
end
