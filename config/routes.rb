Rails.application.routes.draw do
  get 'posts/show'
  get 'posts/new'
  get 'cats/new'
  get 'cats/show'
  get 'users/show'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do
    member do
      get :following
    end
  end
  resources :cats do
    member do
      get :followers
    end
  end
  resources :posts
  resources :relationships
  resources :comments
  resources :favorites
  resources :posts do 
    member do
      put "like" => "posts#vote"
    end
  end
  root 'pages#home'

  get '/:username', to: 'cats#show'
  get 'tags/:tag', to: 'pages#search', as: "tag"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
