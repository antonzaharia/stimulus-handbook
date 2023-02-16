Rails.application.routes.draw do
  devise_for :users
  patch "/users/:id", to: "users#update", as: :edit_user
  get :notifications, to: "notifications#index", as: :notifications

  root "main#index"
  resources :tweets do 
    resources :likes, only: [:create]
  end

  resources :ideas, only: [] do
    patch :move
  end
end
