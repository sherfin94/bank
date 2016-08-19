require 'rails_helper'

RSpec.describe LoansController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  context 'Upon request submission' do
    it 'stores the request' do
      post :create, params: {
        loan: {
          borrower_name: 'sherfin',
          loan_number: '12'
        }
      }
      expect(Loan.find_by!(borrower_name:'sherfin')).not_to eq(nil)
    end
  end

  context 'progress API' do
    it 'returns the progress of the requested loan request' do
      loan = Loan.create!(request_time: Time.now - 5)
      post :progress, params: {
        id: loan.id
      }
      puts response.body
      parsed = JSON.parse(response.body)
      expect(parsed['progress']).to eq(50)
    end
  end
end
