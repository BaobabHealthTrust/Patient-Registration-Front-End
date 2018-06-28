Rails.application.routes.draw do
  get "people/people"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "main#index"

  get "/login" => "main#check_login"
  post "/login" => "main#login"

  resources :people
  resources :patients
  resources :users
end
