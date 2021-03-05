const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  purge: {
    content: ["./src/**/*.html", "./src/**/*.res", "./src/**/*.bs.js"],

    options: {
      safelist: [/^bg-/, /^text-/, /^border-/, /^hover:/],
    },
  },
};
