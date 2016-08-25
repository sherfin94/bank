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
    @loan.status = 'pending'
    session[:id] = @loan.id
    worker_thread = Thread.new do
      Thread.current[:progress] = 0
      while Thread.current[:progress] < 100
        sleep(1)
        Thread.current[:progress] += 10
      end
      @loan.save
    end

    respond_to do |format|
      if @loan.valid?
        session[:worker_thread_id] = worker_thread.object_id
        format.html { render :processing }
      else
        flash[:error] = @loan.errors.full_messages
        format.html { redirect_to root_path, alert: 'Invalid form response' }
      end
    end
  end

  def progress
    worker_thread = ObjectSpace._id2ref(session[:worker_thread_id])
    render json: { progress: worker_thread[:progress] }
  end

  def payment_schedule
    @loan = Loan.find(session[:id])
    generate_payment_schedule if @loan.payments.length.zero?
    render :payment_schedule
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

  def generate_payment_schedule
    @first_payment_date = @loan.first_payment_date
    @final_date = @first_payment_date + @loan.term.years
    @rate = @loan.interest_rate / 100
    @principal_loan_amount = @loan.principal_loan_amount
    @current_date = @first_payment_date
    while @current_date < @final_date
      calculate_and_create_payment
      @current_date = @current_date.next_month
    end
  end

  def calculate_total_payment(present_amount, rate, number_of_periods)
    numerator = present_amount * rate
    denumerator_second_term = 1 / ((1 + rate)**number_of_periods)
    numerator / (1 - denumerator_second_term)
  end

  def calculate_and_create_payment
    number_of_months = ((@final_date - @current_date) / 2_592_000).round
    @total_payment = calculate_total_payment(
      @principal_loan_amount,
      @rate,
      number_of_months
    )
    interest = @principal_loan_amount * @rate
    @principal_payment = @total_payment - interest
    create_payment
    @principal_loan_amount -= @total_payment
  end

  def create_payment
    @loan.payments.create!(
      payment_date: @current_date,
      beginning_balance: @principal_loan_amount,
      principal_payment: @principal_payment,
      total_payment: @total_payment,
      ending_balance: @principal_loan_amount - @total_payment
    )
  end
end
