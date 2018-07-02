Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "main#check_login"

  get "/login" => "main#check_login"
  post "/login" => "main#login"
  get "/logout" => "main#logout"

  get '/people/edit' => 'people#edit'
  post 'people/update' => 'people#update'
  resources :people

  get '/patients/search' => 'patients#search'
  get '/patients/new' => 'patients#new'
  post '/patients/create' => 'patients#create'
  resources :patients

  resources :users
end
