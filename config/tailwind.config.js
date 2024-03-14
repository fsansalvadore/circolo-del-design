const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  mode: 'JIT',
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,html.erb,slim}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['heimat-sans', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ],
};
