FactoryBot.define do
    factory :payment do
      amount { 10.0 }
      name { 'Example payment' }
      association :category, factory: :category
      association :user, factory: :user
    end
  end