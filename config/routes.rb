Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  resources :profiles
  resources :posts
  resources :friends
  resources :friendships, only: [:create, :destroy, :update, :index]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'users/registrations#new', as: :unauthenticated_root
    end
  end

  get "/auth/google_oauth2/callback", to: "omniauth_callbacks#google"


end
