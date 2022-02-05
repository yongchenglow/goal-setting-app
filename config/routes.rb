Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :organizations, only: [ :index,:create, :update, :destroy ]
  resources :teams, only: [ :index,:create, :update, :destroy ]

  resources :user_organizations, only: [ :create ]

  resources :user_teams, only: [ :create, :destroy ]

  resources :organization_goals, only: [ :create, :update, :destroy ] do
    resources :organization_goal_completeds, only: [ :create ]
  end
  resources :organization_goal_completeds, only: [ :destroy ]

  resources :team_goals, only: [ :create, :update, :destroy ] do
    resources :team_goal_completeds, only: [ :create ]
  end
  resources :team_goal_completeds, only: [ :destroy ]

  resources :user_goals, path: '/goals' do
    resources :user_goal_completeds, only: [ :create ]
  end
  resources :user_goal_completeds, only: [ :destroy ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
