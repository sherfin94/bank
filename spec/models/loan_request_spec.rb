require 'rails_helper'

RSpec.describe LoanRequest, type: :model do
  context 'progress' do
    it 'returns 50 for a loan_request made 5 seconds ago' do
      someGuy = LoanRequest.create!(request_time: Time.now - 5)
      expect(someGuy.progress).to eq(50)
    end
  end
end
