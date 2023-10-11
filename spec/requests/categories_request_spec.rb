require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) do
    User.create(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  before(:each) do
    sign_in user
  end

  describe 'GET /categories' do
    it 'returns a successful response for categories for specific user' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template for categories of specific user' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
  describe 'GET #welcome' do
    it 'returns a successful response' do
      get :welcome
      expect(response).to have_http_status(:success)
    end

    it 'renders the welcome template' do
      get :welcome
      expect(response).to render_template(:welcome)
    end
  end
end
