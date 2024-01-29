console.log('Vite ⚡️ Rails')

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/assets/stylesheets/index.css
// import '~/index.css'

import "@hotwired/turbo-rails"
import "@fontsource-variable/inter"

import "../controllers"
import "../../assets/stylesheets/application.css"
