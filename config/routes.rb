Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'user/new'
	root to:'pages#home'
  get '/home', to:'pages#home'
  get '/help', to:'pages#help'
  get '/about', to:'pages#about'
  get '/contact',  to:'pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  

  resources :users
  resources :account_activations, only: [:edit]
  resources :micro_posts, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
