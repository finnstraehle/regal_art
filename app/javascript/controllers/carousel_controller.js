import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ['container', 'slide'];

  connect() {
    this.currentIndex = 0;
  }

  next() {
    if (this.currentIndex < this.slideTargets.length - 1) {
      this.currentIndex += 1;
    } else {
      this.currentIndex = 0;
    }
    this.showSlide(this.currentIndex);
  }

  previous() {
    if (this.currentIndex <= 0) {
      this.currentIndex = (this.slideTargets.length - 1);
    } else {
      this.currentIndex -= 1;
    }
    this.showSlide(this.currentIndex);
  }

  showSlide(index) {
    const slides = this.slideTargets;

    slides.forEach((slide, i) => {
      if (i === index ) {
        slide.classList.add('active');
      } else {
        slide.classList.remove('active');
      }
    });

    this.currentIndex = index;
  }
}
