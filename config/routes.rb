Rails.application.routes.draw do
  root to: 'sessions#welcome'
  
  resources :users
  resources :lists
  resources :list_items do
    member do
      get "mark_completed"
      get "mark_not_completed"
    end
  end

  get 'login', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
end

