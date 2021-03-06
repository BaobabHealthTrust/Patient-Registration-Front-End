Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "main#check_login"

  get "/login" => "main#check_login"
  post "/login" => "main#login"
  get "/logout" => "main#logout"
  get "/reports" => "main#reports"

  get '/people/edit' => 'people#edit'
  resources :people

  get '/patients/search' => 'patients#search'
  get '/patients/new' => 'patients#new'
  post '/patients/create' => 'patients#create'
  resources :patients

  get '/users/new' => 'users#new'
  post '/users/create' => 'users#create'
  resources :users
end
