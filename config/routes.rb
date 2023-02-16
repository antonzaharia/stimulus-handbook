Rails.application.routes.draw do
  devise_for :users
  patch "/users/:id", to: "users#update", as: :edit_user

  root "main#index"
  resources :tweets do 
    resources :likes, only: [:create]
  end
end
