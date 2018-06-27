Rails.application.routes.draw do
  get 'people/people'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  get 'script/index' => 'script#index'
  get 'landing/index' => 'landing#index'

  resources :people
  resources :patients
  resources :users

end
