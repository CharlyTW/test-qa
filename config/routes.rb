Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
  get "/go/:slug", to: "go#show", as: :go
  delete "/logout", to: "sessions#destroy", as: :logout
  resources :listings, only: %i[index show]
end
