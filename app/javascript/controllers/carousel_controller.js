import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ['container', 'slide'];
  currentIndex = 0;

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  next() {
    this.currentIndex += 1;
    this.showSlide(this.currentIndex);
  }

  previous() {
    this.currentIndex -= 1;
    this.showSlide(this.currentIndex);
  }

  showSlide(index) {
    const slides = this.containerTargets;
    if (index < 0) {
      index = slides.length - 1;
    } else if (index >= slides.length) {
      index = 0;
    }

    slides.forEach((slide, i) => {
      slide.style.display = i === index ? 'block' : 'none';
    });

    this.currentIndex = index;
  }
}
