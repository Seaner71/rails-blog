Rails.application.routes.draw do
  resources :users, only: [:create]
  get '/signup', to: 'users#new'
  # trying something out changing root to user#new from user#show -worked somewhat but above not working
  root to: 'users#new'

  resources :sessions, only: [:create]
  get '/signin', to: 'sessions#new'
  post '/logout', to: "sessions#logout"
  #dont believe Ill use welcome anymore #TODO delte if sure
  # resources :welcome, only: [:create, :index]
  resources :users, except: [:create, :update] do
        resources :posts
  end
  resources :posts, only: [:show, :index, :create, :destroy, :edit]
  resources :comments, only: [:create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
