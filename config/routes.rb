Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items
  resources :orders do
    resources :items, only: :create
  end
end
