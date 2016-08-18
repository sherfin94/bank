require 'rails_helper'

RSpec.describe LoanRequestsController, type: :controller do

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
        loan_request: {
          borrower_name: 'sherfin',
          loan_number: '12'
        }
      }
      expect(LoanRequest.find_by!(borrower_name:'sherfin')).not_to eq(nil)
    end
  end
end
