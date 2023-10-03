Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :categories, only: [:index, :new, :create,:destroy] do
    resources :payments, only: [:index, :new, :create]
  end
  root "categories#index"
end
