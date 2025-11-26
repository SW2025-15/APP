Rails.application.routes.draw do
  
  resources :posts
  
  root 'posts#index'
  get "posts/index"
  get 'posts/new', to: 'posts#new'
  
  post 'bookmarks', to: 'bookmarks#create'

  get "up" => "rails/health#show", as: :rails_health_check
end
