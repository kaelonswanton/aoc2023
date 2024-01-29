/** @type {import("tailwindcss").Config} */
const colors = require("tailwindcss/colors")
const defaultTheme = require("tailwindcss/defaultTheme")

module.exports = {
  content: [
    "./app/components/**/*.{rb,html.erb,erb}",
    "./app/views/**/*.{rb,html,html.erb,erb}",
    "./spec/previews/**/*.rb",
    "./config/initializers/heroicon.rb",
    "./config/initializers/simple_form.rb",
  ],
  theme: {
    fontFamily: {
      ...defaultTheme.fontFamily,
      sans: ["Inter Variable", ...defaultTheme.fontFamily.sans],
    },
    extend: {
      spacing: {
        xs: "var(--spacing-xs)",
        sm: "var(--spacing-sm)",
        md: "var(--spacing-md)",
        lg: "var(--spacing-lg)",
        xl: "var(--spacing-xl)",
      },
      gap: {
        xs: "var(--spacing-xs)",
        sm: "var(--spacing-sm)",
        md: "var(--spacing-md)",
        lg: "var(--spacing-lg)",
        xl: "var(--spacing-xl)",
      },
      padding: {
        xs: "var(--spacing-xs)",
        sm: "var(--spacing-sm)",
        md: "var(--spacing-md)",
        lg: "var(--spacing-lg)",
        xl: "var(--spacing-xl)",
      },
      margin: {
        xs: "var(--spacing-xs)",
        sm: "var(--spacing-sm)",
        md: "var(--spacing-md)",
        lg: "var(--spacing-lg)",
        xl: "var(--spacing-xl)",
      },
    },
  },
  corePlugins: {
    container: false,
    fontWeight: false
  },
  plugins: [
    require("@tailwindcss/typography"),
    require("daisyui"),
    require("./app/javascript/tailwindcss/variable_font_plugin"),
  ],
}
