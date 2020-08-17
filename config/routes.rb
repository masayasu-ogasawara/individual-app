Rails.application.routes.draw do
  devise_for :users
  resources :users,only:[:show]
  resources :games,only:[:index,:new,:show,:create] do
    resources :comments, only:[:create,:update,:destroy]
  end
  root 'games#index'
end
