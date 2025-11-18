return {
  "MagicDuck/grug-far.nvim",
  cmd = { "GrugFar", "GrugFarWithin" },
  keys = {
    {
      "<leader>fr",
      function()
        require("grug-far").open()
      end,
      desc = "Find/Replace (project)",
    },
    {
      "<leader>fR",
      function()
        require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
      end,
      desc = "Find/Replace (current file)",
    },
    {
      "<leader>fw",
      function()
        local word = vim.fn.expand("<cword>")
        require("grug-far").open({ prefills = { search = word, flags = "--hidden --glob !**/node_modules/**" } })
      end,
      desc = "Find word under cursor",
    },
    { "<leader>fs", ":'<,'>GrugFarWithin<CR>", mode = "v", desc = "Find/Replace (selection)" },
    {
      "<leader>fp",
      function()
        -- Only TS/TSX/JS/JSX in src/ + app/, ignore node_modules/. Great for Next.js
        require("grug-far").open({
          prefills = {
            flags = table.concat({
              "--hidden",
              '--glob "!**/node_modules/**"',
              '--glob "src/**"',
              '--glob "app/**"',
              '--glob "**/*.ts"',
              '--glob "**/*.tsx"',
              '--glob "**/*.js"',
              '--glob "**/*.jsx"',
            }, " "),
          },
        })
      end,
      desc = "Find/Replace (Next/React sources)",
    },
  },
  opts = {
    engine = "ripgrep", -- default; supports inline-edit + sync
    debounce_ms = 120, -- snappy UI without spamming rg
    show_replace_preview = true, -- live replace preview
    max_results = 5000, -- tune for big repos
    disable_icons = false, -- set true if you don’t use devicons/nerd font
    history = { max_items = 30 },
    mappings = {
      -- inside the results window:
      apply = "A", -- apply replacements
      sync = "S", -- sync inline edits back to files
      open_entry = "<CR>", -- jump to file/line
      toggle_command = "gc", -- show underlying rg command
      abort = "q",
    },
    -- Opinionated ripgrep flags for JS/TS monorepos
    default_flags = "--hidden --no-heading --with-filename --line-number --column",
  },
}
