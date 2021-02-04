Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users

  
  # get 'users/new', to: 'users#new', as: 'new_user'
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'

  resources :artworks, except: [:new, :edit]
  resources :artwork_shares, except: [:new, :edit]
end
