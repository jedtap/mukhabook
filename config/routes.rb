Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index]
  resources :friends, only: [:index]

  root "posts#index"
end
