import { Controller } from '@hotwired/stimulus'
import Toastify from 'toastify-js'

// Connects to data-controller="toastify"
export default class extends Controller {
  connect() {
    const backgroundColors = {
      info: '#0d6efd',
      error: '#f44336',
      warning: '#ffae11',
    }
    JSON.parse(document.body.dataset.flashMessages).forEach((flashMessage) => {
      const [type, message] = flashMessage
      Toastify({
        text: message,
        duration: 15000,
        close: true,
        gravity: 'bottom',
        position: 'right',
        style: {
          background: backgroundColors[type],
          color: type === 'warning' ? 'black' : 'white',
        },
        stopOnFocus: true,
      }).showToast()
    })
  }
}
