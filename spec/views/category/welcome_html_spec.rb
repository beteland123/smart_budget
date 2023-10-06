require 'rails_helper'

RSpec.describe 'categories/welcome.html.erb', type: :view do
  before do
    render
  end

  it 'displays the page title' do
    expect(rendered).to have_selector('h1', text: 'Smart Budget')
  end

  it "renders a 'Sign Up' link" do
    expect(rendered).to have_link('Sign Up', href: new_user_registration_path)
  end

  it "renders a 'Log In' link" do
    expect(rendered).to have_link('Log In', href: new_user_session_path)
  end
end
