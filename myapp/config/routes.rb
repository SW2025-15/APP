Rails.application.routes.draw do
  
  root 'posts#index'
  get "posts/index"
  get 'posts/new', to: 'posts#new'

  get "up" => "rails/health#show", as: :rails_health_check
end
