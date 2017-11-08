Rails.application.routes.draw do
  root to: "app#index"
  get "/index", to: "app#index", as: "index"
  get "/checkout", to: "app#checkout", as: "checkout"
  get "/mens", to: "app#mens", as: "mens"
  get "/womens", to: "app#womens", as: "womens"
  post "/signup", to: "users#create", as: "signup"
  post "/signin", to: "sessions#create", as: "signin"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :products
end
