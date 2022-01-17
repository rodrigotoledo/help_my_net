import { Controller } from '@hotwired/stimulus'
import SlimSelect from 'slim-select'

export default class extends Controller {
  static values = { url: String }

  connect() {
    let _this = this
    new SlimSelect({
      select: this.element,
      searchingText: 'Searching...',
      ajax: function (search, callback) {
        if (search.length < 3) {
          callback('Need 3 characters')
          return
        }

        let url = new URL(_this.urlValue)
        url.search = new URLSearchParams({ query: search })

        fetch(url)
          .then((response) => response.json())
          .then((json) => callback(json))
          .catch((error) => callback(error))
      },
    })
  }
}
