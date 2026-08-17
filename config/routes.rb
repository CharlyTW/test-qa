Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
  get "/go/:slug", to: "go#show", as: :go
  delete "/logout", to: "sessions#destroy", as: :logout
  resources :listings, only: %i[index show]
  post "/listings/:listing_id/contact", to: "conversations#create", as: :contact_listing

  resources :conversations, only: %i[index show] do
    member do
      post :archive
    end
    resources :messages, only: %i[create]
  end
end
