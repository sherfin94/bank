require 'rails_helper'

context 'on submit' do
  it 'shows the requested received page' do
    #visit 'loans/new'
    #fill_in 'Borrower name', with: 'something'
    #fill_in 'Loan number', with: 23
    #fill_in 'Principal loan amount', with: 10000
    #within '#loan_first_payment_date_input' do find('option[value="2011"]').click end
    #within '#loan_first_payment_date_input' do first('option[value="1"]').click end
    #within '#loan_first_payment_date_input' do first('option[value="30"]').click end
    #within '#loan_first_payment_date_input' do first('option[value="00"]').click end
    #within '#loan_first_payment_date_input' do first('option[value="59"]').click end
    #fill_in 'Interest rate', with: 10
    #fill_in 'Term', with: 2
    #click_button 'Create Loan'
    #expect(page).to have_selector('#loading-bar')
  end

  it 'shows error message when we do not fill all the required fields' do
    visit '/loans/new'
    click_button 'Create Loan'
    expect(page).to have_selector('#error')
  end

  it 'shows error messages corresponding to each submission error' do
    visit '/loans/new'
    click_button 'Create Loan'
    expect(page).to have_text('Borrower name can\'t be blank')
  end
end
