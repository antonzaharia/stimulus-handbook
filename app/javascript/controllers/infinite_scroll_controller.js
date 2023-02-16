import { Controller } from '@hotwired/stimulus'
import Rails from '@rails/ujs'

// Connects to data-controller="infinite-scroll"
export default class extends Controller {
  static targets = ['entries', 'pagination']

  scroll() {
    let next_page = this.paginationTarget.querySelector("a[rel='next']")
    if (next_page == null) {
      return
    }

    let url = next_page.href
    let body = document.body,
      html = document.documentElement
    let height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)
    if (window.pageYOffset >= height - window.innerHeight) {
      this.loadMore(url)
    }
  }

  loadMore(url) {
    console.log('load')
    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        this.entriesTarget.insertAdjacentHTML('beforeend', data.entries), (this.paginationTarget.innerHTML = data.pagination)
      },
    })
  }
}
