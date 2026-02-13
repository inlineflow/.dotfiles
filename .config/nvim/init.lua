vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autochdir = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"
vim.opt.cursorline = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.filetype.add({
  extension = {
    h = "c",
  },
})

-- vim.cmd [[hi @string guifg=pink]]

local quickfix = require("config.custom.quickfix")
-- vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.keymap.set("n", "-", "<cmd>Oil<CR>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })

-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>q", quickfix.local_diagnostics, { desc = "Open diagnostic [Q]uickfix list" })

vim.filetype.add({ extension = { templ = "templ" } })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local function run_build_script()
  local git_dir = vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
  local build_script = git_dir .. "/build.sh"
  if vim.fn.filereadable(build_script) ~= 0 then
    vim.system({ "./build.sh" }, { cwd = git_dir, text = true }, function(obj)
      print(obj.code)
      print(obj.signal)
      if obj.stderr ~= "" then
        print("build failed")
        print(obj.stderr)
        return
      end
      print(obj.stdout)
    end)
    -- local job_id = vim.fn.jobstart({ "/bin/bash", build_script }, {
    --   on_stdout = function(job_id, data, event)
    --     if data then
    --       print("STDOUT: " .. table.concat(data, "\n"))
    --     end
    --   end,
    --   on_stderr = function(job_id, data, event)
    --     if data ~= {} then
    --       print("STDERR: " .. table.concat(data, "\n"))
    --     end
    --   end,
    --   -- on_exit = function(job_id, code, event)
    --   --   print("Build script with job_id [" .. job_id .. "] finished with exit code: " .. code)
    --   -- end,
    -- })
  else
    vim.notify("no build.sh found at the root directory of the project")
  end
  print(build_script)
end

vim.keymap.set("n", "<leader>b", run_build_script, { desc = "Run build script" })

require("config.lazy")
-- require("config.custom.quickfix").setup()
require("config.git.push").setup()
