import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "messages"]
  static values = {
    roomId: String
  }

  connect() {
    this.formTarget.addEventListener("submit", this.handleSubmit.bind(this))
    this.scrollToBottom()
  }

  handleSubmit(event) {
    event.preventDefault()
    const form = event.target
    const formData = new FormData(form)

    fetch(form.action, {
      method: "POST",
      body: formData,
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Accept": "text/vnd.turbo-stream.html"
      }
    }).then(response => response.text())
      .then(html => {
        Turbo.renderStreamMessage(html)
        this.inputTarget.value = ""
        this.scrollToBottom()
      })
  }

  scrollToBottom() {
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
  }
} 