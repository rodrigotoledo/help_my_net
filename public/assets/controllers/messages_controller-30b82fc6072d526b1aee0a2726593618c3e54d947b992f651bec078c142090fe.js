import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    document
      .getElementById(this.element.dataset.chatBodyId)
      .scrollIntoView({ behavior: 'smooth', block: 'end' })
  }

  reset() {
    document
      .getElementById(this.element.dataset.chatBodyId)
      .scrollIntoView({ behavior: 'smooth', block: 'end' })
    this.element.reset()
  }
};
