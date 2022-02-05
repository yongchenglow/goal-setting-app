Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :goals do
    resources :goal_completeds, only: [ :create ]
  end
  resources :goal_completeds, only: [ :destroy ]

  resources :organizations do
    resources :teams, only: [ :create, :update ]
  end
  resources :teams, only: [ :index, :destroy ]

  resources :user_organizations, only: [ :create ]

  resources :user_teams, only: [ :create, :destroy ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
