import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pop-up"
export default class extends Controller {

  static targets = ["box", "button"];

  connect() {
    console.log("connected");
  }

  showPopup(event) {
    event.preventDefault();
    this.boxTarget.classList.add("active");
  }

  closePopup() {
    this.boxTarget.classList.remove("active");
   }
}
