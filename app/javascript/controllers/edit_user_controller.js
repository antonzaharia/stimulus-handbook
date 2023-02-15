import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="edit-user"
export default class extends Controller {
  static targets = ['newPassword', 'passwordConfirmation', 'currentPassword', 'updateButton']
  connect() {
    this.newPasswordTarget.addEventListener('keyup', (e) => {
      if (e.target.value.length === 0) {
        this.passwordConfirmationTarget.disabled = true
      } else {
        this.passwordConfirmationTarget.disabled = false
      }
    })
    this.currentPasswordTarget.addEventListener('keyup', (e) => {
      if (e.target.value.length === 0) {
        this.updateButtonTarget.disabled = true
      } else {
        this.updateButtonTarget.disabled = false
      }
    })
  }
}
