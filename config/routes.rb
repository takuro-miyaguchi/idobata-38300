Rails.application.routes.draw do
  get 'friends/followings'
  get 'friends/followers'
  devise_for :users
  resources :users do
    resource :friends, only: [:create, :destroy]
    get 'followings' => 'friends#followings', as: 'followings'
    get 'followers' => 'friends#followers', as: 'followers'
  end
  root to: "informations#index"
  resources :informations
end
