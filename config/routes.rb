Rails.application.routes.draw do
  root to: "app#index"
  get "/index", to: "app#index", as: "index"
  get "/checkout", to: "app#checkout", as: "checkout"
  post "/signup", to: "users#create", as: "signup"
  post "/signin", to: "sessions#create", as: "signin"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :products
  resources :categories
end
