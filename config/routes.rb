Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  resources :profiles
  resources :posts
  resources :friends
  resources :friendships, only: [:create, :destroy]

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
    unauthenticated :user do
      # root 'devise/registrations#new', as: :unauthenticated_root
      root 'users/registrations#new', as: :unauthenticated_root
    end
  end
  
end
