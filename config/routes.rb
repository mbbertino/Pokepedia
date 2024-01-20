
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
  direct :cdn_image do |model, options|
    if Rails.env.production?
      expires_in = options.delete(:expires_in) { ActiveStorage.urls_expire_in }

      if model.respond_to?(:signed_id)
        route_for(
          :rails_service_blob_proxy,
          model.signed_id(expires_in: expires_in),
          model.filename,
          options.merge(host: Rails.application.credentials.dig(:cdn, :host))
        )
      else
        signed_blob_id = model.blob.signed_id(expires_in: expires_in)
        variation_key  = model.variation.key
        filename       = model.blob.filename

        route_for(
          :rails_blob_representation_proxy,
          signed_blob_id,
          variation_key,
          filename,
          options.merge(host: Rails.application.credentials.dig(:cdn, :host))
        )
      end
    else
      rails_blob_url(model, options)
    end
  end
end
