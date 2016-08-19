class RenameLoanRequestToLoan < ActiveRecord::Migration[5.0]
  def change
    rename_table :loan_requests, :loans
  end
end
