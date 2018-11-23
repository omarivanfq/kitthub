Rails.application.routes.draw do
  get 'shares/new'
  get 'shares/create'
  get 'shares/destroy'
  get 'profiles/create'
  get 'profiles/update'
  get 'profiles/edit'
  get 'profiles/destroy'
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
  resources :shares
  resources :posts do 
    member do
      put "like" => "posts#vote"
    end
  end

  root 'pages#home'
  get 'tags/:tag', to: 'pages#search', as: "tag"
  get 'favorited', to: 'pages#favorited'
  get 'favorited/:id', to: 'pages#favorited', as: "id"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
