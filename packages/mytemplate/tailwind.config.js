const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  corePlugins: {
    aspectRatio: false,
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
  ],
  purge: {
    content: ["./src/**/*.html", "./src/**/*.res", "./src/**/*.bs.js"],

    options: {
      safelist: [/^bg-/, /^text-/, /^border-/, /^hover:/],
    },
  },
};
