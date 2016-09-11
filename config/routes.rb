Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :exercises, only: [:show, :index]
  resources :exercise_strenght_tests, only: [:index, :create, :update]
  resources :strenght_based_progressions, only: [:index, :create, :show] do
    resources :strenght_based_progression_steps, only: [:index, :create], as: :steps
  end

  resources :users
end
