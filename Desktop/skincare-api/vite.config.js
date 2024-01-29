import {defineConfig} from "vite"
import Rails from "vite-plugin-rails"

export default defineConfig({
  clearScreen: false,
  plugins: [
    Rails({
      fullReload: {
        additionalPaths: [
          "config/routes.rb",
          "app/components/**/*"
        ],
        delay: 300
      },
    }),
  ],
})

