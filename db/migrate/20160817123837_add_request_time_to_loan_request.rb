class AddRequestTimeToLoanRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :loan_requests, :request_time, :datetime
  end
end
