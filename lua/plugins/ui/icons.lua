return {
  "Mirsmog/real-icons.nvim",
  event = "VeryLazy",
  build = ":RealIcons install",
  opts = {
    integrations = {
      snacks_picker = true,
    },
  },
}
