Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/exhibits', to: 'exhibits#index'
  get '/exhibits/new', to: 'exhibits#new'

  get '/museums', to: 'museums#index'
  get '/museums/new', to: 'museums#new'
  post '/museums', to: 'museums#create'
end
