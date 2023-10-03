Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get "/custom_sign_out" => "devise/sessions#destroy", as: :custom_destroy_user_session
  end
  resources :categories, only: [:index, :new, :create,:destroy] do
    resources :payments, only: [:index, :new, :create]
  end
  root "categories#index"
end
