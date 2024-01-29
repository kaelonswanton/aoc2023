import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

const controllers = import.meta.globEager(
  "./../../../app/components/ui/**/controller.js"
)

for (let path in controllers) {
  let module = controllers[path]
  console.log(path)

  let name = path
    .match(/ui\/(.+)\/controller\.js$/)[1]
    .replaceAll("_", "-")
    .replaceAll("/", "--")


  application.register(name, module.Controller)
}

export { application }
