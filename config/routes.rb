Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :companies do
  resource :favorites, only: [:create, :destroy]
  resources :company_comments, only: [:create, :destroy]
end
  root 'homes#top'
  get '/about' => 'homes#about'
end
