import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inline-edit"
export default class extends Controller {
  static targets = ["body", "form"]
  connect() {
  }

  toggle() {
    this.bodyTarget.classList.add('hidden')
    this.formTarget.classList.remove('hidden')
  }
}
