
Rails.application.routes.draw do
  # Health Check Route
  get "up" => "rails/health#show", as: :rails_health_check

  # Default route
  root to: "home#show"

  # Pokemon Routes
  resources :pokemons, only: [:index, :show]

  # PWA Routes
  get "service-worker.js", to: "pwa#service_worker"
  get "manifest.json", to: "pwa#manifest"
end
