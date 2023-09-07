import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pop-up"
export default class extends Controller {

  static targets = ["box", "button"];

  connect() {
    console.log("connected");

  }

  showPopup(event) {
    if (this.hasDisabledAttribute()) {
      return;
    }
    else{
      event.preventDefault();
      this.boxTarget.classList.add("active");
    }
  }

  closePopup() {
    this.boxTarget.classList.remove("active");
   }

   hasDisabledAttribute() {
    return this.buttonTarget.hasAttribute("disabled");
   }

}
