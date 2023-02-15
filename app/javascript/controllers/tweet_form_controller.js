import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tweet-form"
export default class extends Controller {
  static targets = ["body", "characterCount"]
  connect() {
    this.update()
  }

  update() {
    let count = this.bodyTarget.value.length
    let message = ''

    if (count === 1) {
      message = "1 character"
    } else {
      message = `${count} characters`
    }
    this.characterCountTarget.textContent = message
  }
}
