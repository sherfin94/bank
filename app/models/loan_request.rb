class LoanRequest < ApplicationRecord
  def progress
    ((Time.now - self.request_time) * 10).round
  end
end
