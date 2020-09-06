Rails.application.routes.draw do
  get 'buyer/index'
  devise_for :users
  root "items#index"
  resources :items
  resources :users
  resources :buyer
end
