require 'rails_helper'

RSpec.feature 'Payments', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category) }
  let(:payments) { FactoryBot.create_list(:payment, 3, category:) }

  before do
    user.confirm
    sign_in user
  end

  scenario 'User views the payments page' do
    visit category_payments_path(category)

    expect(page).to have_content('Payments page')
    expect(page).to have_selector(".icon_name img[src*='#{url_for(category.icon)}']")
    expect(page).to have_content(category.name)
    expect(page).to have_content('Total Amount: $30')

    payments.each do |payment|
      expect(page).to have_content(payment.name)
      expect(page).to have_content("$#{payment.amount}")
    end

    expect(page).to have_link('Add Transactions', href: new_category_payment_path(category_id: category.id))
    expect(page).to have_link('Back', href: categories_path)
  end
end
