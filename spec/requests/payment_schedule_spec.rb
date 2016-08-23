
describe 'payment schedule request' do
  it 'brings the payment page upon request' do
    loan = FactoryGirl.create(:loan)
    visit "loans/payment_schedule/#{loan.id}"
    expect(page).to have_selector('.title')
  end
end
