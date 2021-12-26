import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {}

  reset() {
    this.element.reset()
  }
}
