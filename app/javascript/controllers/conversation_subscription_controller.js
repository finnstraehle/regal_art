import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="conversation-subscription"
export default class extends Controller {
  static values = { conversationId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    console.log("Connected to conversation subscription controller!")
    this.channel = createConsumer().subscriptions.create(
      { channel: "ConversationChannel", id: this.conversationIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
  }

  initialize() {
    this.scrollToBottom()
  }

  #insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message1, data.message2)
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.element.scrollTo(0, this.element.scrollHeight)
  }
  #buildMessageElement(currentUserIsSender, message1, message2) {
    return currentUserIsSender ? message2 : message1
  }
  resetForm(event) {
    event.target.reset()
  }
  disconnect() {
    console.log("Disconnected from conversation subscription controller!")
    this.channel.unsubscribe()
  }
  scrollToBottom() {
    this.element.scrollTop = this.element.scrollHeight
  }
}
