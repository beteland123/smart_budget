

require 'rails_helper'

RSpec.feature 'Payments', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) {  FactoryBot.create(:category) }
  let(:payment) {  FactoryBot.create(:payment, category: category) }
  before do
    user.confirm
    sign_in user
  end

  scenario 'User visits the payment show page' do
    visit category_payment_path(category, payment)

    expect(page).to have_content(payment.name)
    expect(page).to have_content(payment.amount)
    expect(page).to have_content(payment.created_at.strftime("%Y-%m-%d %H:%M:%S"))
  end
end