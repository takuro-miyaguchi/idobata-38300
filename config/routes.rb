Rails.application.routes.draw do
  devise_for :users
  root to: "informations#index"
  resources :informations
  resources :users
end
