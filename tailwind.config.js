module.exports = {
  theme: {},
  variants: {},
  plugins: [],
  safelist: [
    {
      pattern:
        /(bg|text|to|from)-(red|yellow|orange|green|blue|primary|indigo|purple|pink|gray)-(50|100|200|300|400|500|600|700|800|900)/,
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

// Add the following if you want to whitelist classes
// options: {
//   whitelistPatterns: [/^bg-/, /^text-/, /^border-/, /^hover:/],
// },
