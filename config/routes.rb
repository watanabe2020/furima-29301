Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :users
  resources :items do
    resource :favorites, only: [:create, :destroy]
    resources :buyer
    collection do
      post 'search'
    end
  end

end
