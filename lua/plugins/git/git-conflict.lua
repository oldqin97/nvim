-- Git 冲突标记快速解决
return {
  "rhysd/conflict-marker.vim",
  cmd = { "ConflictMarkerOurselves", "ConflictMarkerThemselves", "ConflictMarkerBoth" },
  keys = {
    { "<leader>co", "<cmd>ConflictMarkerOurselves<CR>", desc = "Conflict Ourselves" },
    { "<leader>ct", "<cmd>ConflictMarkerThemselves<CR>", desc = "Conflict Themselves" },
    { "<leader>cb", "<cmd>ConflictMarkerBoth<CR>", desc = "git conflict apply both" },
  },
}
