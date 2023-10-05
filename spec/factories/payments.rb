FactoryBot.define do
    factory :payment do
      amount { 10.0 }
      name { 'Example payment' }
      created_at { Time.current }
      association :category, factory: :category
      association :user, factory: :user
    end
  end