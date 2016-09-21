Rails.application.routes.draw do
  root 'pages#index'
  get '/about' => 'pages#about'
  get '/events' => 'events#index'
  get '/teams' => 'teams#index'
  post '/teams' => 'teams#create'
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'
  post '/teams/roster/:id' => 'users#add_team'
  delete '/teams/roster/:id' => 'users#remove_team'
end
