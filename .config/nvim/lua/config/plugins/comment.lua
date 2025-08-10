return {

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "tsx", "typescript", "javascript", "jsx" },
        -- context_commentstring = {
        --   enable = true,
        --   enable_autocmd = false,
        --   config = {
        --     tsx = {
        --       __default = '// %s',
        --       jsx_element = '{/* %s */}',
        --       jsx_fragment = '{/* %s */}',
        --       jsx_attribute = '// %s',
        --       comment = '// %s',
        --     },
        --     typescript = { __default = '// %s', __multiline = '/* %s */' },
        --     javascript = { __default = '// %s' },
        --   },
        -- },
      }
      require("ts_context_commentstring").setup {
        enable_autocmd = false,
        languages = {
          tsx = {
            __default = '// %s',
            jsx_element = '{/* %s */}',
            jsx_fragment = '{/* %s */}',
            jsx_attribute = '// %s',
            comment = '// %s',
          },
          typescript = { __default = '// %s', __multiline = '/* %s */' },
          javascript = { __default = '// %s' },
        }
      }
    end,
  },

  "numToStr/Comment.nvim",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  config = function()
    require("Comment").setup {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end
}
