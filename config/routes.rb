Rails.application.routes.draw do
  resources :posts, only: [:index]
  resources :friends, only: [:index]

  root "posts#index"
end
