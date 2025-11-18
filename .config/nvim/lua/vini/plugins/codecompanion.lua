local provider = vim.env.NVIM_AI_PROVIDER or "copilot"

local model_by_provider = {
  ollama = "qwen2.5-coder:7b-instruct",
  copilot = nil, -- Copilot doesn't need a model
}

return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
      chat = {
        adapter = provider, -- dynamic
        model = model_by_provider[provider],
      },
      inline = {
        adapter = provider, -- dynamic
        model = model_by_provider[provider],
      },
    },

    adapters = {
      http = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = { default = "llama3.1" },
            },
          })
        end,
      },
    },
  },
}
