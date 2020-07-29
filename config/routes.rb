Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  get 'users/:id/all_posts', to: "posts#all_posts"
  # resources :comments, only: [:new, :create]
  # get 'comments/new', to: "comments#new"
  # post '/comments', to: "comments#create"
  get '/about', to: "posts#about"
end
