Rails.application.routes.draw do
  root 'static#home'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'
  get '/logout', to: 'session#destroy'
  get '/auth/facebook/callback' => 'session#omniauth'
  get '/auth/failure' => redirect('/signin')
  patch '/beers/:beer_id/comments', to:  'comments#update'
  

  resources :users
  #resources :comments
  resources :beers do
    resources :comments
  end
end
