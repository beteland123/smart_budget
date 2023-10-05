require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:user) do
    User.create(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  before(:each) do
    allow_any_instance_of(User).to receive(:confirmed?).and_return(true)
    sign_in user
  end
  let(:category) do
    Category.create(
      name: 'Fast Food',
      icon: 'imgexample.png',
      user: user
    )
  end

  describe 'GET /payments' do
    it 'returns a successful response for payements for specific user' do
      get :index, params: { category_id: category.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template for payements of specific user' do
      get :index, params: { category_id: category.id }
      expect(response).to render_template(:index)
    end
  end
  describe 'GET #new' do
    it 'returns a successful response' do
      get :new, params: { category_id: category.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new, params: { category_id: category.id }
      expect(response).to render_template(:new)
    end
  end
  describe 'GET #show' do
    it 'returns a successful response' do
        payment = Payment.create(
            name: 'Burger',
            amount: 1.5,
            user: user,
            category: category
          )
      get :show, params: { category_id: category.id, id: payment.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
        payment = Payment.create(
            name: 'Burger',
            amount: 1.5,
            user: user,
            category: category
          )
      get :show, params: { category_id: category.id, id: payment.id }
      expect(response).to render_template(:show)
    end
  end
end