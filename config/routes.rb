Rails.application.routes.draw do
  root 'pages#index'
  get '/about' => 'pages#about'
  get '/events' => 'events#index'
  get '/teams' => 'teams#index'
  post '/teams' => 'teams#create'
end
