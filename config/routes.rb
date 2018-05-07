Rails.application.routes.draw do
  get 'welcome/index'

  get '/articles/search', to: 'articles#search'
  post '/articles/search', to: 'articles#search'
  
  resources :articles do
  	resources :comments
  end
  resources :tags
  root 'welcome#index'

end
