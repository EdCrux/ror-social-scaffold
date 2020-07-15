Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users
  resources :friendships, only: [:index, :create]
  resources :users, only: [:index, :show, :update, :destroy]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

end
