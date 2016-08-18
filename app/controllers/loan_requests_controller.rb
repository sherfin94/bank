class LoanRequestsController < ApplicationController
  def index
    @loan_requests = LoanRequest.all
  end

  def show
  end

  def new
    @loan_request = LoanRequest.new
  end

  def create
    @loan_request = LoanRequest.create(loan_request_params)
    @loan_request.request_time = Time.now
    @loan_request.save!
  end

  private

  def loan_request_params
    params.require(:loan_request)
          .permit(
            :borrower_name,
            :loan_number,
            :principal_loan_amount,
            :closing_date,
            :first_payment_date,
            :interest_rate,
            :term,
            :loan_type
    )
  end
end
