Rails.application.routes.draw do
  root to: "app#index"
  get "/index", to: "app#index", as: "index"
  get "/checkout", to: "app#checkout", as: "checkout"
  get "/auth/:provider/callback", :to => "sessions#create"
  get "/auth/failure", :to => "sessions#failure"
  post "/signup", to: "users#create", as: "signup"
  post "/signin", to: "sessions#create", as: "signin"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :products
  resource :carts, only: [:show, :destroy]
  resources :order_items, only: [:create, :update, :destroy]
  resources :categories
  resources :searches, only: :index
end
