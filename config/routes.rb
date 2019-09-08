Rails.application.routes.draw do
  root to: "toppages#index"
  
  
  get 'signup', to: 'users#new'
  get "search", to: "users#index"
  get "mypage", to: "users#show"
  resources :users
  
end
