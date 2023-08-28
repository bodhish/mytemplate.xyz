const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  safelist: [
    {
      pattern:
        /(bg|text)-(red|yellow|orange|green|blue|primary|indigo|purple|pink|gray)-(50|100|200|300|400|500|600|700|800|900)/,
      variants: ["hover", "focus"],
    },
  ],

  content: [
    "./src/**/*.html",
    "./src/**/*.res",
    "./src/**/*.bs.js",
    "./packages/mytemplate/src/**/*.res",
    "./packages/mytemplate/src/**/*.bs.js",
  ],
};
