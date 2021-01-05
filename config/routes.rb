Rails.application.routes.draw do
  root to: 'homes#top'
  get "home/about" => "homes#about"
  
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end

end