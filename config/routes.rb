Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'script/index' => 'script#index'
  get 'landing/index' => 'landing#index'
  root 'users#index'
end
