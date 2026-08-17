// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

function classifyMessages() {
  const accountId = document.body.dataset.currentAccountId
  if (!accountId) return

  document.querySelectorAll("#messages .message[data-sender-id]").forEach((el) => {
    const mine = el.dataset.senderId === accountId
    el.classList.toggle("message--mine", mine)
    el.classList.toggle("message--theirs", !mine)
  })
}

document.addEventListener("turbo:load", classifyMessages)
document.addEventListener("turbo:render", classifyMessages)

const messagesRoot = () => document.getElementById("messages")

document.addEventListener("turbo:load", () => {
  const list = messagesRoot()
  if (!list || list.dataset.classifiedObserver) return

  list.dataset.classifiedObserver = "1"
  new MutationObserver(classifyMessages).observe(list, { childList: true })
})
