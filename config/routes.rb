Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users
  resources :friendships, only: [:index, :create, :update]
  resources :users, only: [:index, :show, :destroy]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

end
