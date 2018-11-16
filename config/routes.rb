Rails.application.routes.draw do
  get 'cats/new'
  get 'cats/show'
  get 'users/show'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :cats
  root 'pages#home'

  get '/:username', to: 'cats#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
