Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'categories#index'

  get '/items', to: 'items#index'

  resources :categories do
    resources :items
  end
end
