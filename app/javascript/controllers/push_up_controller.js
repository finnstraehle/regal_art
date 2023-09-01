import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="push-up"
export default class extends Controller {
  static targets = [ "journey", "loginSignup", "blackveil" ]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  hideAndPush(event) {
    if (!this.element.contains(event.relatedTarget)) {
      this.journeyTarget.style.opacity = 0
      const boxtop = parseInt(getComputedStyle(this.loginSignupTarget).top.replace('px',''))
      this.loginSignupTarget.style.top = `${boxtop - 360}px`
      this.loginSignupTarget.style.opacity = 1
      this.blackveilTarget.style.opacity = 1
    }
  }
}
