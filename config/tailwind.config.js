const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        grass: "#22c55e",
        fire: "#fb923c",
        water: "#60a5fa",
        electric: "#fde047",
        ice: "#2dd4bf",
        fighting: "#991b1b",
        poison: "#7e22ce",
        ground: "#b45309",
        flying: "#7dd3fc",
        psychic: "#fb7185",
        bug: "#65a30d",
        rock: "#78716c",
        ghost: "#312e81",
        dark: "#27272a",
        dragon: "#1d4ed8",
        steel: "#0e7490",
        fairy: "#f9a8d4",
        normal: "#6b7280"
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
