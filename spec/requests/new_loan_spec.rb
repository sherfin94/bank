require 'rails_helper'

context 'on submit' do
  it 'shows the requested received page' do
    visit 'loans/new'
    click_button 'Create Loan'
    expect(page).to have_selector('#loading-bar')
  end
end
