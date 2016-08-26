require 'rails_helper'

def post_sample_request
  post :create, params: {
    loan: {
      borrower_name: 'MyString',
      loan_number: 1,
      principal_loan_amount: 1.5,
      closing_date: '2016-08-17 13:14:31',
      first_payment_date: '2016-06-17 13:14:31',
      interest_rate: 1.5,
      term: 1,
      loan_type: 'MyString'
    }
  }
end

RSpec.describe LoansController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  context 'Upon request submission' do
    it 'stores the request' do
      post_sample_request
      expect(Loan.find_by!(borrower_name: 'MyString')).not_to eq(nil)
    end
  end

  context 'progress API' do
    it 'returns the progress of the requested loan request' do
      loan = FactoryGirl.create(:loan, request_time: Time.now - 5)
      session[:id] = loan.id
      post :progress, params: {
        id: loan.id
      }
      puts response.body
      parsed = JSON.parse(response.body)
      expect(parsed['progress']).to eq(50)
    end
  end

  context 'When a new Loan is created' do
    it 'sets the status as pending' do
      # allow(Thread).to receive(:sleep)
      post_sample_request
      # allow(Thread).to receive(:sleep).and_call_original
      # sleep(1)
      loan = Loan.find_by(borrower_name: 'MyString')
      expect(loan.status).to eq('pending')
    end
  end

  describe 'LoansController#payment_schedule' do
    it 'creates and stores payment schedule' do
      loan = FactoryGirl.create(:loan, request_time: Time.now - 11)

      get :payment_schedule, params: {
        id: loan.id
      }, session: { id: loan.id }
      payment = Payment.find_by(loan_id: loan.id)
      expect(payment).not_to be_nil
    end

    it 'creates one payment in the case of one month duration' do
      loan = FactoryGirl.create(
        :loan,
        first_payment_date: 2.month.ago,
        closing_date: 1.month.ago
      )

      get :payment_schedule, params: {
        id: loan.id
      }, session: { id: loan.id }
      payment = Payment.find_by(loan_id: loan.id)
      expect(payment.loan.loan_number).to eq(loan.loan_number)
    end
  end

  it 'stores the loan id in the session' do
    allow(Thread).to receive(:sleep)
    post_sample_request
    loan = Loan.find(session[:id])
    expect(loan.borrower_name).to eq('MyString')
  end

  it 'starts a thread when create action is requested' do
    allow(Thread).to receive(:new)
    post_sample_request
    expect(Thread).to have_received(:new)
  end

  it 'saves the loan object created' do
    allow(Thread).to receive(:new)
    post_sample_request
    allow(Thread).to receive(:sleep)
    # sleep(10.5)
    expect(Loan.find_by(borrower_name: 'MyString').loan_number).to eq(1)
  end

  #  describe 'for_each_month_between' do
  #    it 'iterates over each month between the dates given' do
  #      a = Date.today
  #      b = Date.today.next_month.next_month
  #      current_date = Date.today
  #      LoansController.for_each_month_between(a, b) do |month_first_date|
  #        expect(current_date.month).to eq(month_first_date.month)
  #        current_date = current_date.next_month
  #      end
  #    end
  #  end
end
