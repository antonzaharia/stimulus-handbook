import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="tweet-form"
export default class extends Controller {
  static targets = ['body', 'characterCount', 'ideasForm']
  connect() {
    this.update()
  }

  update() {
    let count = this.bodyTarget.value.length
    let message = ''

    if (count === 1) {
      message = '1 character'
    } else {
      message = `${count} characters`
    }
    this.characterCountTarget.textContent = message

    if (count > 140) {
      this.characterCountTarget.classList.add('text-orange-500')
    } else {
      this.characterCountTarget.classList.remove('text-orange-500')
    }
    if (count > 0) {
      this.ideasFormTarget.classList.remove('hidden')
    } else {
      this.ideasFormTarget.classList.add('hidden')
    }
  }

  submit(event) {
    let count = this.bodyTarget.value.length
    if (count > 140) {
      event.detail.formSubmission.stop()
    }
  }
}
