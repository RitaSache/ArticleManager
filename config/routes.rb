Rails.application.routes.draw do
  resources :authors
  get 'welcome/index'

  get '/articles/search', to: 'articles#search'
  post '/articles/search', to: 'articles#search'
  get '/articles/Report', to: 'articles#Report', defaults: { format: 'csv' }
  get '/articles/LastBatch', to: 'articles#LastBatch', defaults: { format: 'csv' }

  
  resources :articles do
  	resources :comments
  end
  resources :tags
  root 'welcome#index'

end
