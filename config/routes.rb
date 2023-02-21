Rails.application.routes.draw do
  root "home#index"
  resources :albums

  get 'home/index'
end
