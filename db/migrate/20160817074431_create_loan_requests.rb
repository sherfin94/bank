class CreateLoanRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :loan_requests do |t|
      t.string :borrower_name
      t.integer :loan_number
      t.float :principal_loan_amount
      t.datetime :closing_date
      t.datetime :first_payment_date
      t.float :interest_rate
      t.integer :term
      t.string :loan_type

      t.timestamps
    end
  end
end
