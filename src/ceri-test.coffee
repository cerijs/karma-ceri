require("document-register-element/pony")(global,'force')
window.__karma__.loaded = ->
document.addEventListener "DOMContentLoaded", ->
  if window.ceri?.tests?
    for view,i in window.ceri.tests
      name = "view-nr#{i}"
      window.customElements.define name, view
      document.body.appendChild document.createElement(name)
  setTimeout window.__karma__.start, 100
