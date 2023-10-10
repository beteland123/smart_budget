require 'rails_helper'

RSpec.feature 'Payments', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category) }
  let(:payments) { FactoryBot.create_list(:payment, 3, category:) }

  before do
    sign_in user
  end

  scenario 'User views the payments page' do
    visit category_payments_path(category)

    expect(page).to have_content('PAYMENTS')
    expect(page).to have_content('$30')

    payments.each do |payment|
      expect(page).to have_content(payment.name)
      expect(page).to have_content("$#{payment.amount}")
    end

    expect(page).to have_link('Add Transactions', href: new_category_payment_path(category_id: category.id))
    expect(page).to have_link('Back', href: categories_path)
  end
end
