Rails.application.routes.draw do
  root to: "toppages#index"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  
  get 'signup', to: 'users#new'
  get "search", to: "users#index"
  get "mypage", to: "users#show"
  resources :users
  
  resources :interviews
end

