Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about"
  get 'searches/search', as: 'search'


  resources :users,only: [:show,:index,:edit,:update]
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end

  resources :users do
  	member do
     get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
  get 'following' => 'relationships#following', as: 'following'
  get 'followers' => 'relationships#followers', as: 'followers'

end