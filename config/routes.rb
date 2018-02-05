Rails.application.routes.draw do
root "home#index"

resources :clients, except: [:show]
end
