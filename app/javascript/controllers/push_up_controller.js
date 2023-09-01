import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="push-up"
export default class extends Controller {
  static targets = [ "journey", "loginSignup" ]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  hideAndPush(event) {
    if (!this.element.contains(event.relatedTarget)) {
      this.journeyTarget.style.display = "none"
      this.loginSignupTarget.style.top = parseInt(this.loginSignupTarget.style.top) + 100 + "px"
      // this.loginSignupTarget.style.display = "block"
    }
  }
}
