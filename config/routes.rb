Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :goals do
    resources :goal_completeds, only: [ :create ]
  end
  resources :goal_completeds, only: [ :destroy ]

  resources :organizations do
    resources :teams, only: [ :create, :update ]
    resources :user_organizations, only: [ :create ]
  end
  resources :teams, only: [ :destroy ]

  resources :teams, only: [ :create, :update ] do
    resources :user_teams, only: [ :create ]
  end
  resources :user_teams, only: [ :destroy ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
