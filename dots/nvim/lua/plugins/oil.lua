return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  keys = {
    {
      mode = { "n", "v" },
      "-",
      function()
        require("oil").open_float()
      end,
      desc = "Open Oil",
    },
  },
  opts = {
    columns = {
      "size",
      "mtime",
      "icon",
    },

    keymaps = {
      -- disable
      ["<Cr>"] = "",
      ["<C-c>"] = "",
      ["<C-p>"] = "",

      -- change to other
      ["q"] = "actions.close",
      ["gl"] = "actions.select",
      ["gp"] = "actions.preview",
    },
    view_options = {
      show_hidden = true,
    },
  },
}
