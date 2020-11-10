Rails.application.routes.draw do
  root "posts#index"
  get 'friendships/update'
  get 'friendships/destroy'
  devise_scope :user do
    get '/users/sign_in', to: 'devise/sessions#new', as: 'sign_in'
    get '/users/sign_up', to: 'devise/registrations#new', as: 'sign_up'
    get '/users/sign_out', to: 'devise/sessions#destroy', as: 'sign_out'
  end

  devise_for :users
  resources :users, only: [:index, :show]
  resources :friendships
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
