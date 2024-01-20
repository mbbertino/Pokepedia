
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

  # config/routes.rb
  direct :cdn_image do |blob|
    if Rails.env.production?
      # Use env for cdn host
      File.join(Rails.application.credentials.dig(:cdn, :host), blob.key)
    else
      # Preserve the behaviour of `rails_blob_url` where S3 or the CDN might not be configured
      route_for(:rails_blob, blob)
    end
  end
end
