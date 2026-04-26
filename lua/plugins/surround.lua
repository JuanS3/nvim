require("nvim-surround").setup({
  -- Aliases for common surrounds
  aliases = {
    ["a"] = "<",
    ["b"] = ")",
    ["B"] = "}",
    ["r"] = "]",
    ["q"] = { '"', "'", "`" },
    ["s"] = { "{", "[", "(", "<", '"', "'", "`" },
  },
  -- Move cursor to the beginning/end of the surrounding
  move_cursor = "begin",
})

-- Default keymaps in nvim-surround v4 (no need to configure in setup):
--   Normal:  ys, yS, yss, ySs, ySS, ds, cs, cS
--   Visual:  S, gS
--   Insert:  <C-g>s, <C-g>S
