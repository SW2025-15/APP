Rails.application.routes.draw do
  get "questions/index"
  get "questions/show"
  get "questions/new"
  get "questions/create"
  get "users/index"
  get "users/new"
  get "users/create"
  
  resources :posts
  resources :questions
  
  root 'posts#index'
  get "posts/index"
  get 'posts/new', to: 'posts#new'
  
  get "up" => "rails/health#show", as: :rails_health_check
  
end
