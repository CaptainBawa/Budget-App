Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
  unauthenticated do
    root "splash_screen#index", as: :unauthenticated_root
  end
  resources :categories, only: [:index, :new, :show, :create] do
    resources :details, only: [:index, :new, :create]
  end
end
