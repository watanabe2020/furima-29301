Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :users
  resources :items do
    resources :buyer
    collection do
      post 'search'
    end
  end

end
