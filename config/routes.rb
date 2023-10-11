Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
 
  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
   # Root route for non-authenticated users (welcome page)
  unauthenticated do
    root to: 'categories#welcome', as: :unauthenticated_root
  end

  resources :categories do
    resources :payments 
  end
  root "categories#welcome"
end
