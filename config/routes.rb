Rails.application.routes.draw do
  devise_for :users
  get 'users/search' => 'users#search', as: 'user_search'
  get 'friends/:id' => 'friends#index', as: 'friends'
  resources :users do
    resource :friends, only: [:create, :destroy, :update]
  end
  root to: "informations#index"
  resources :informations
end
