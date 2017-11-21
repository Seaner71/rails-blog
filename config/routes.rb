Rails.application.routes.draw do
  root 'welcome#index'
  resources :welcome, only: [:create, :index]
  resources :users, except: [:edit, :update] do
        resources :posts, only: [:show]
  end
  resources :posts, only: [:show, :index, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  
