import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="user-name"
export default class extends Controller {
  static targets = ['saveButton', 'nameInput']
  connect() {
    this.nameInputTarget.addEventListener('keyup', (e) => {
      this.saveButtonTarget.disabled = e.target.value === '' ? true : false
    })
  }
}