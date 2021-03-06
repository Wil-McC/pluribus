Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/exhibits', to: 'exhibits#index'
  get '/exhibits/new', to: 'exhibits#new'
  post '/exhibits', to: 'exhibits#create'
  get '/exhibits/:id', to: "exhibits#show"
  get '/exhibits/:id/edit', to: 'exhibits#edit'
  patch '/exhibits/:id', to: 'exhibits#update'
  delete '/exhibits/:id', to: 'exhibits#destroy'


  #patrons routes
  get '/patrons', to: 'patrons#index'
  get '/patrons/new', to: 'patrons#new'
  post '/patrons', to: 'patrons#create'
  get '/patrons/:id', to:'patrons#show'
  get 'patrons/:id/edit', to:'patrons#edit'
  patch '/patrons/:id', to: 'patrons#update'
  delete '/patrons/:id', to: 'patrons#destroy'


  #exhibit_patron_routes
  get'/exhibits/:id/patrons', to: 'exhibit_patrons#index'
  post '/exhibits/:id/patrons', to: 'exhibit_patrons#create'
  get '/exhibits/:id/patrons/new', to: 'exhibit_patrons#new'

  get '/museums', to: 'museums#index'
  get '/museums/new', to: 'museums#new'
  post '/museums', to: 'museums#create'
  get '/museums/:id', to: 'museums#show'
  get '/museums/:id/edit', to: 'museums#edit'
  patch '/museums/:id', to: 'museums#update'
  delete '/museums/:id', to: 'museums#destroy'
  get '/museums/:id/artifacts', to: 'museums#collection'
  get '/museums/:id/artifacts/new', to: 'museums#acquire'
  # artifacts routes
  get '/artifacts', to: 'artifacts#index'
  get '/artifacts/:id', to: 'artifacts#show'
  get '/artifacts/:id/edit', to: 'artifacts#edit'
  patch '/artifacts/:id', to: 'artifacts#update'
  delete 'artifacts/:id', to: 'artifacts#destroy'
  post 'museums/:id/artifacts', to: 'artifacts#create'
end
