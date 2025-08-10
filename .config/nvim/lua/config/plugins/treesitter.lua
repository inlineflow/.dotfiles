return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "tsx", "typescript", "javascript" },
        sync_install = false,
        auto_install = false,
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
        highlight = {
          enable = true,

          -- disable = { "c", "rust" },
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = true,
        },
      }
    end
  }
}
