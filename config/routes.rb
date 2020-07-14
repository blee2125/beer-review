Rails.application.routes.draw do
  root 'static#home'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'

  resources :users
  resources :beers

end
