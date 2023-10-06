require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) do
    User.create(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  let(:category) do
    Category.new(
      name: 'Fast Food',
      icon: 'imgexample.png',
      user:
    )
  end

  it 'is valid with valid attributes' do
    payment = Payment.new(
      name: 'Burger',
      amount: 1.5,
      user:,
      category:
    )
    expect(payment).to be_valid
  end

  it 'is not valid without a name' do
    payment = Payment.new(
      amount: 1.5,
      user:,
      category:
    )
    expect(payment).to_not be_valid
  end

  it 'is not valid without an amount' do
    payment = Payment.new(
      name: 'Burger',
      user:,
      category:
    )
    expect(payment).to_not be_valid
  end

  describe 'associations' do
    it 'belongs to user' do
      payment = Payment.new(
        name: 'Burger',
        amount: 1.5,
        user:,
        category:
      )
      expect(payment.user).to eq(user)
    end

    it 'belongs to category' do
      payment = Payment.new(
        name: 'Burger',
        amount: 1.5,
        user:,
        category:
      )
      expect(payment.category).to eq(category)
    end
  end
end
