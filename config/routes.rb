Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  resources :posts, only: [:index]
  resources :friends, only: [:index]

  root "posts#index"
end
