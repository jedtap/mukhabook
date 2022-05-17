Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  
  resources :posts
  # post "posty", to: "posts#create"
  # get "posty", to: "posts#new"

  resources :friends  #  , only: [:index]

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  
end
