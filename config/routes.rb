Rails.application.routes.draw do
  root "home#index"
  resources :clients, except: [:show]
  resources :products, except: [:show]
  resources :orders, except: [:show]
end
