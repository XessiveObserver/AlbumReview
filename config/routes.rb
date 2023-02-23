Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  
  resources :albums do
    resources :comments
  end
  
  root "home#index"
end
