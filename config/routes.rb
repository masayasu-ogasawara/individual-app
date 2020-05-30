Rails.application.routes.draw do
  devise_for :users
  root 'games#index'
  resources :games,only:[:index,:new,:show,:create]
  resources :users,only:[:show]
  resources :games do
    resources :comments,only:[:create]
  end
end