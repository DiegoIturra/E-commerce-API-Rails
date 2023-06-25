Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'signup', to: 'users#new'
  get 'users', to: 'users#get_all_users'
  get '/users/:id', to: 'users#get_user'
  post 'users', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'
  delete 'users', to: 'users#destroy_all_users'

  get 'carts', to: 'carts#show'
  post 'carts', to: 'carts#create'
end
