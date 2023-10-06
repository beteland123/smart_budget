require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) do
    User.create(name: 'John Doe', email: 'john@example.com', password: 'password123',
                password_confirmation: 'password123')
  end
  it 'is valid with valid attributes' do
    category = Category.new(
      name: 'Fast Food',
      icon: 'imgexample.png',
      user:
    )
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(
      icon: 'imgexample.png',
      user:
    )
    expect(category).to_not be_valid
  end
  it 'is not valid without a icon' do
    category = Category.new(
      name: 'Fast Food',
      user:
    )
    expect(category).to_not be_valid
  end
  describe 'associations' do
    it 'has many payments' do
      expect(Category.reflect_on_association(:payments).macro).to eq(:has_many)
    end
    it 'belongs to user' do
      category = Category.new(
        name: 'Fast Food',
        icon: 'imgexample.png',
        user:
      )
      expect(category.user).to eq(user)
    end
  end
end
