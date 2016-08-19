class Loan < ApplicationRecord
  has_many :payments
  def progress
    ((Time.now - self.request_time) * 10).round
  end
end
