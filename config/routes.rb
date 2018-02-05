Rails.application.routes.draw do
root "home#index"

  get 'clients/destroy'

  get 'clients/index'

  get 'clients/create'

  get 'clients/new'

  get 'clients/edit'

  get 'clients/update'
end
