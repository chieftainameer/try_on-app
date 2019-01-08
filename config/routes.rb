Rails.application.routes.draw do
  get 'users/new'
  get 'user/new'
	root to:'pages#home'
  get '/home', to:'pages#home'
  get '/help', to:'pages#help'
  get '/about', to:'pages#about'
  get '/contact',  to:'pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
