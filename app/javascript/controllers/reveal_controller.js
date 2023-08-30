import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reveal"
export default class extends Controller {
  static targets = [ "item" ]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  display() {
    this.itemTarget.style.display = "block"
  }

  displaynone() {
    this.itemTarget.style.display = "none"
  }
}
