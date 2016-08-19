FactoryGirl.define do
  factory :loan do
    borrower_name "MyString"
    loan_number 1
    principal_loan_amount 1.5
    closing_date "2016-08-17 13:14:31"
    first_payment_date "2016-08-17 13:14:31"
    interest_rate 1.5
    term 1
    loan_type "MyString"
  end
end
