FactoryBot.define do
  factory :category do
    name { 'Example Category' }
    icon { 'example_icon.png' }
    created_at { Time.current }

    association :user, factory: :user
    after(:create) do |category|
      create_list(:payment, 3, category:, user: category.user)
    end
  end
end
