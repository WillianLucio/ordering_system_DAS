Rails.application.routes.draw do
  get 'clients/index'

  get 'clients/create'

  get 'clients/new'

  get 'clients/edit'

  get 'clients/update'

  get 'clients/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
