Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  resources :posts, only: [:index]
  resources :friends, only: [:index]

  # root "posts#index"

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  
end
