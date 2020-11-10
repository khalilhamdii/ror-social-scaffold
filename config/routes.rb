Rails.application.routes.draw do
  root "posts#index"
  get 'friendships/update'
  get 'friendships/destroy'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friendships
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
