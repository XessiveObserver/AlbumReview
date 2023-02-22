Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  
  resources :albums

  get 'home/index'
end
