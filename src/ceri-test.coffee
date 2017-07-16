require("document-register-element/pony")(global,'force')
i = 0
hyphenate = (str) -> str.replace(/([^-])([A-Z])/g, '$1-$2').toLowerCase()
window.ceriTest = (ce) ->
  if ce.prototype.tests?
    name = "view-nr#{i++}"
    window.customElements.define name, ce
    el = document.createElement(name)
    for k,v of el.tests
      describe hyphenate(k), ->
        before (done) -> 
          document.body.appendChild el
          el.$nextTick -> el.$nextTick -> el.$nextTick done
        after -> el.remove()
        v.call(el,el)
