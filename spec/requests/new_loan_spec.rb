require 'rails_helper'

context 'on submit' do
  it 'shows the requested received page' do
    visit 'loan_requests/new'
    click_button 'Create Loan request'
    expect(page).to have_selector('#loading-bar')
  end
end
