import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-button"
export default class extends Controller {
  static targets = [ "button" ]

  connect() {
  }

  toggle() {
    this.buttonTarget.classList.toggle('clicked');
  }
}
