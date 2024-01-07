class PwaController < ApplicationController
  protect_from_forgery except: :service_worker

  def service_worker
    render template: "pwa/service-worker", layout: false
  end

  def manifest
    render template: "pwa/manifest", layout: false
  end
end
