class Loan < ApplicationRecord
  validates :borrower_name,
            :principal_loan_amount,
            :loan_number,
            :first_payment_date,
            :interest_rate,
            :term,
            presence: true
  has_many :payments
  def progress
    ((Time.now - self.request_time) * 10).round
  end
end
