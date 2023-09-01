import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pop-up"
export default class extends Controller {

  static targets = ["box", "button"];

  connect() {
    console.log("connected");
  }

  showPopup(event) {
    event.preventDefault();
    console.log("showPopup");
    console.log(this.boxTarget);
    this.boxTarget.classList.add("active");
  }

  closePopup() {
    this.boxTarget.classList.remove("active");
   }
}
