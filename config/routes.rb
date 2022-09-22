Rails.application.routes.draw do
  devise_for :users
  get 'users/search' => 'users#search', as: 'user_search'
  get 'friends/:id' => 'friends#index', as: 'friends'
  resources :users do
    resource :friends, only: [:create, :destroy, :update]
  end
  root to: "informations#index"
  get 'informations/favorites' => 'favorites#index', as: 'favorites'
  resources :informations do
    resource :favorites, only: [:create, :destroy]
  end
end
