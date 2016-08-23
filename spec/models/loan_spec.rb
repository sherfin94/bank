require 'rails_helper'

RSpec.describe Loan, type: :model do
  context 'progress' do
    it 'returns 50 for a loan_request made 5 seconds ago' do
      someGuy = FactoryGirl.create(:loan,request_time: Time.now - 5)
      expect(someGuy.progress).to eq(50)
    end

    it 'cannot be created without name' do
      expect {FactoryGirl.create(:loan, borrower_name: nil)}.to raise_error ActiveRecord::RecordInvalid
    end

    it 'cannot be created without principal amount' do
      expect {FactoryGirl.create(:loan, principal_loan_amount: nil)}.to raise_error ActiveRecord::RecordInvalid
    end

    it 'cannot be created without loan number' do
      expect {FactoryGirl.create(:loan, loan_number: nil)}.to raise_error ActiveRecord::RecordInvalid
    end

    it 'cannot be created without first payment date' do
      expect {FactoryGirl.create(:loan, first_payment_date: nil)}.to raise_error ActiveRecord::RecordInvalid
    end

    it 'cannot be created without first payment date' do
      expect {FactoryGirl.create(:loan, interest_rate: nil)}.to raise_error ActiveRecord::RecordInvalid
    end

    it 'cannot be created without first payment date' do
      expect {FactoryGirl.create(:loan, term: nil)}.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
