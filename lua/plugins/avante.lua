require("avante").setup({
  -- ===================================================================
  -- PROVIDER CONFIGURATION
  -- ===================================================================
  -- Default provider is Claude (Anthropic). You can change this to:
  --   - "openai"     (ChatGPT / GPT-4)
  --   - "copilot"    (GitHub Copilot)
  --   - "azure"      (Azure OpenAI)
  --   - "moonshot"   (Kimi / Moonshot AI)
  --
  -- To use Moonshot (Kimi), uncomment the moonshot block below and set:
  --   export MOONSHOT_API_KEY="your-key"
  --
  provider = "claude",

  -- All provider configs go inside this table (avante.nvim v2+ structure)
  providers = {
    -- -------------------------------------------------------------------
    -- Claude (Anthropic) — default
    -- Requires: export ANTHROPIC_API_KEY="your-key"
    -- -------------------------------------------------------------------
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-sonnet-4-20250514",  -- or "claude-opus-4", "claude-sonnet-4", etc.
      timeout = 30000,
      extra_request_body = {
        temperature = 0,
        max_tokens = 4096,
      },
    },

    -- -------------------------------------------------------------------
    -- OpenAI — uncomment to use ChatGPT / GPT-4
    -- Requires: export OPENAI_API_KEY="your-key"
    -- -------------------------------------------------------------------
    -- openai = {
    --   endpoint = "https://api.openai.com/v1",
    --   model = "gpt-4o",
    --   timeout = 30000,
    --   extra_request_body = {
    --     temperature = 0,
    --     max_tokens = 4096,
    --   },
    -- },

    -- -------------------------------------------------------------------
    -- Moonshot (Kimi) — uncomment to use Kimi AI
    -- Requires: export MOONSHOT_API_KEY="your-key"
    -- Get your key at: https://platform.moonshot.cn/
    -- -------------------------------------------------------------------
    -- moonshot = {
    --   endpoint = "https://api.moonshot.cn/v1",
    --   model = "kimi-latest",  -- or "kimi-k2-5", "moonshot-v1-32k", etc.
    --   timeout = 30000,
    --   api_key_name = "MOONSHOT_API_KEY",
    --   extra_request_body = {
    --     temperature = 0,
    --     max_tokens = 4096,
    --   },
    -- },

    -- -------------------------------------------------------------------
    -- Copilot — uncomment to use GitHub Copilot
    -- Requires: GitHub Copilot subscription + copilot.lua
    -- -------------------------------------------------------------------
    -- copilot = {
    --   model = "gpt-4o-copilot",
    --   proxy = nil,
    --   allow_insecure = false,
    --   timeout = 30000,
    --   extra_request_body = {
    --     temperature = 0,
    --     max_tokens = 4096,
    --   },
    -- },
  },

  -- ===================================================================
  -- BEHAVIOUR
  -- ===================================================================
  behaviour = {
    auto_suggestions = false,  -- Disable inline suggestions (use Codeium for that)
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = true,
    minimize_diff = true,
  },

  -- ===================================================================
  -- UI
  -- ===================================================================
  windows = {
    ---@type "right" | "left" | "top" | "bottom"
    position = "right",
    wrap = true,
    width = 30,
    sidebar_header = {
      enabled = true,
      align = "center",
      rounded = true,
    },
  },

  -- ===================================================================
  -- HIGHLIGHTS
  -- ===================================================================
  highlights = {
    diff = {
      current = "DiffText",
      incoming = "DiffAdd",
    },
  },

  -- ===================================================================
  -- MAPPINGS (avante provides its own, these are extras)
  -- ===================================================================
  -- Default avante mappings (when in normal mode):
  --   <leader>aa  — Open sidebar
  --   <leader>ar  — Refresh sidebar
  --   <leader>af  — Focus sidebar
  --   <leader>ae  — Edit selected blocks
  --   <leader>an  — Select next block
  --   <leader>ap  — Select prev block
  -- In visual mode:
  --   <leader>ae  — Ask avante about selection
})

-- Optional: custom keymaps for avante actions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ai", ":AvanteAsk<CR>", opts)
vim.keymap.set("v", "<leader>ai", ":AvanteAsk<CR>", opts)
