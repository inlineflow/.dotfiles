return {
  {
    'saghen/blink.cmp',
    -- dependencies = { 'rafamadriz/friendly-snippets', "L3MON4D3/LuaSnip" },
    dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },

    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },
      snippets = { preset = "luasnip" },

      appearance = {
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      signature = { enabled = true },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
