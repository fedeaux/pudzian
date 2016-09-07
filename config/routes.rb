Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :exercises, only: [:show, :index]
  resources :users
end
