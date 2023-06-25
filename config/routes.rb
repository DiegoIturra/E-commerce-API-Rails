Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'signup', to: 'users#new'
  get 'users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  post 'users', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'
  delete 'users', to: 'users#destroy_all_users'

  get 'carts', to: 'carts#index'
  get '/carts/:id', to: 'carts#show'
  post 'carts', to: 'carts#create'
  delete '/carts/:id', to: 'carts#destroy'
  delete 'carts', to: 'carts#destroy_all_carts'

  get 'articles', to: 'articles#index'
  get '/articles/:id', to: 'articles#show'
  post 'articles', to: 'articles#create'
  patch '/articles/:id', to: 'articles#update'
  delete '/articles/:id', to: 'articles#destroy'
  delete 'articles', to: 'articles#destroy_all_articles'
  
end
