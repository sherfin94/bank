class LoansController < ApplicationController
  def index
    @loans = Loan.all
  end

  def show
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.create(loan_request_params)
    @loan.request_time = Time.now
    @loan.save!

    respond_to do |format|
      format.html { render :processing }
    end
  end

  def progress
    loan_request = Loan.find(params[:id])
    render json: { progress: loan_request.progress }
  end

  private

  def loan_request_params
    params.require(:loan)
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
