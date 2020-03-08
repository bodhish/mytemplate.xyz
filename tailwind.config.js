const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  theme: {
    extend: {
      colors: {
        primary: {
          100: "#F0EAFB",
          200: "#D3BFF3",
          300: "#B08EE6",
          400: "#976AE2",
          500: "#6025C0",
          600: "#4D1E9A",
          700: "#380D80",
          800: "#35156B",
          900: "#1F0D40"
        },
        secondary: {
          100: "#FEE6EF",
          200: "#FCB5D0",
          300: "#FF80B0",
          400: "#F95392",
          500: "#F61067",
          600: "#AC0645",
          700: "#A61149",
          800: "#7B0531",
          900: "#4A031E"
        },
        gray: {
          100: "#FBFAFC",
          200: "#F7F5FA",
          300: "#F1EDF7",
          400: "#DFDAE8",
          500: "#BFB8CC",
          600: "#9187A1",
          700: "#7D728F",
          800: "#6A5F7A",
          900: "#453C52"
        }
      }
    }
  }
};
