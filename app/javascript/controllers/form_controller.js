import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  resetComponent() {
    setInterval(() => {
      this.element.reset()
    }, 100)
  }
}
