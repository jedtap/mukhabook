Rails.application.routes.draw do
  resources :posts, only: [:index]

  root "posts#index"
end
