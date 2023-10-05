require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
    let(:user) { FactoryBot.create(:user) }
    
      before(:each) do
        user.confirm
        sign_in user
      end
    

  scenario 'User views categories when there are categories available' do
    categories = FactoryBot.create_list(:category, 3, user: user)

    visit categories_path

    expect(page).to have_content('Categories')

    categories.each do |category|
        within(".each:nth-of-type(#{categories.index(category) + 1})") do
          within(".leftDiv") do
            expect(page).to have_css("img[src='#{category.icon}']")
            expect(page).to have_link(category.name, href: "/categories/#{category.id}/payments")
            expect(page).to have_content(category.created_at)
          end
      
          within(".rightDiv") do
            expect(page).to have_content("Amount #{category.payments.sum(:amount)}")
            expect(page).to have_button("Delete Category")
          end
        end
      end

    expect(page).to have_link('Add Category', href: new_category_path)
  end

  scenario 'User views categories when there are no categories available' do
    visit categories_path

    expect(page).to have_content('Categories')
    expect(page).to have_content('There is no categories you have yet!')
    expect(page).to have_link('Add Category', href: new_category_path)
  end
end