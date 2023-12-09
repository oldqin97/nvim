return {
  "rhysd/conflict-marker.vim",
  event = "BufReadPost",
  keys = {
    { "<leader>co", "<cmd>ConflictMarkerOurselves<CR>", desc = "git conflict apply themes" },
    { "<leader>ct", "<cmd>ConflictMarkerThemselves<CR>", desc = "git conflict apply ours" },
    { "<leader>cb", "<cmd>ConflictMarkerBoth<CR>", desc = "git conflict apply both" },
  },
}
