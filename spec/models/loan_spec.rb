require 'rails_helper'

RSpec.describe Loan, type: :model do
  context 'progress' do
    it 'returns 50 for a loan_request made 5 seconds ago' do
      some_guy = FactoryGirl.create(:loan, request_time: Time.now - 5)
      expect(some_guy.progress).to eq(50)
    end

    it { should validate_presence_of :borrower_name }
    it { should validate_presence_of :principal_loan_amount }
    it { should validate_presence_of :loan_number }
    it { should validate_presence_of :first_payment_date }
    it { should validate_presence_of :interest_rate }
    it { should validate_presence_of :term }
  end
end
