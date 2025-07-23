return {
  "petertriho/nvim-scrollbar",
  config = function ()
    require("scrollbar").setup({
      show = true,
      show_in_active_only = false,
      set_highlights = true,
      handle = {
        color = "#4c4f69",
      },
      marks = {
        Search = { color = "#df8e1d" },
        Error = { color = "#d20f39" },
        Warn = { color = "#e64443" },
        Info = { color = "#04a5e5" },
        Hint = { color = "#40a02b" },
        Misc = { color = "#8839ef" },
      }
    })
  end
}
