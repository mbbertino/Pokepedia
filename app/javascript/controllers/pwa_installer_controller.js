import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pwa-installer"
export default class extends Controller {
  connect() {
   if (this.isUsingPWA() || this.customInstallUnSupported()) {
    this.element.remove()
   } else {
      window.addEventListener("beforeinstallprompt", (event) => {
        event.preventDefault();
        this.installPrompt = event;
        this.element.removeAttribute("hidden");
      });
    }
  }

  install() {
    this.installPrompt.prompt();

    this.installPrompt.userChoice.then(({ outcome }) => {
      if (outcome === "accepted") this.element.remove()
    });
  }

  isUsingPWA = () => {
    return window.matchMedia("(display-mode: standalone)").matches;
  }

  customInstallSupported = () => {
    let userAgent = navigator.userAgent;

    return userAgent.includes("Chrome") || userAgent.includes("Chromium");
  }

  customInstallUnSupported = () => {
    return !this.customInstallSupported();
  }
}
