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
end
