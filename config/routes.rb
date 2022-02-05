Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :goals do
    resources :goal_completeds, only: [ :new, :create ]
  end
  resources :goal_completeds, only: [ :destroy ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
