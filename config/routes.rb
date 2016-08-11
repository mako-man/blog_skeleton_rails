Rails.application.routes.draw do
  resources :statuses
  #get 'posts/index'
  resources :posts
  root 'posts#index'
end
