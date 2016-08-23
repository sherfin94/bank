class Loan < ApplicationRecord
  validates :borrower_name, presence: true
  validates :principal_loan_amount, presence: true
  validates :loan_number, presence: true
  validates :first_payment_date, presence: true
  validates :interest_rate, presence: true
  validates :term, presence: true
  has_many :payments
  def progress
    ((Time.now - self.request_time) * 10).round
  end
end
