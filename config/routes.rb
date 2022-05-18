Rails.application.routes.draw do
  devise_for :users

  resources :profiles
  resources :posts
  resources :friends

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  
end
