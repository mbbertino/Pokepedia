import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroller"
export default class extends Controller {
  static targets = [ "scrollable" ]

  scrollToTop = () => {
    this.scrollableTarget.scrollTo({ top: 0, behavior: "smooth" })
  }
}
