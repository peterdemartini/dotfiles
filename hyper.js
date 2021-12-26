module.exports = {
  config: {
    updateChannel: "stable",

    fontSize: 22,

    fontFamily: "SauceCodePro Nerd Font",

    cursorColor: "rgba(248,28,229,0.8)",

    cursorShape: "BLOCK",

    cursorBlink: false,

    foregroundColor: "#fff",

    backgroundColor: "#000",

    borderColor: "#333",

    css: "",

    termCSS: "",

    padding: "0 0",

    colors: {
      black: "#000000",
      red: "#ff0000",
      green: "#33ff00",
      yellow: "#ffff00",
      blue: "#0066ff",
      magenta: "#cc00ff",
      cyan: "#00ffff",
      white: "#d0d0d0",
      lightBlack: "#808080",
      lightRed: "#ff0000",
      lightGreen: "#33ff00",
      lightYellow: "#ffff00",
      lightBlue: "#0066ff",
      lightMagenta: "#cc00ff",
      lightCyan: "#00ffff",
      lightWhite: "#ffffff",
    },

    shell: "/usr/local/bin/fish",

    shellArgs: ["--login"],

    env: {},

    bell: false,

    copyOnSelect: false,

    hypercwd: {
      initialWorkingDirectory: "~",
    },
  },

  plugins: [
    "hyperterm-1password",
    "hypercwd",
    "hyper-search",
    "hyper-tab-icons",
    "hyperfullscreen",
    "hyperterm-atom-dark",
    "hyper-pane",
    "hyper-ayu-mirage",
    "hyperterm-paste"
  ],

  localPlugins: [],

  keymaps: {},
}
