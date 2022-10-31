vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.number = true
vim.o.undofile = true

-- References:
--  - https://github.com/neovim/nvim-lspconfig#suggested-configuration
--  - https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp
--  - https://github.com/hrsh7th/nvim-cmp/
--  - https://github.com/hrsh7th/cmp-nvim-lsp
--  - https://github.com/saadparwaiz1/cmp_luasnip
--  - https://github.com/L3MON4D3/LuaSnip
--  - https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua#L190
--  - https://github.com/molleweide/LuaSnip-snippets.nvim/blob/d7e40e4cce622eab2316607dbcd8d6039bcb9fe0/lua/luasnip_snippets/snippets/c.lua#L26-L43
--  - https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
--  - https://github.com/L3MON4D3/LuaSnip/blob/69cb81cf7490666890545fef905d31a414edc15b/lua/luasnip/config.lua#L82-L104
--  - https://codevion.github.io/#!vim/treelsp.md
--  - https://github.com/nihilistkitten/dotfiles/blob/main/nvim/lua/lsp.lua
--  - https://github.com/nvim-telescope/telescope.nvim
--  - https://github.com/nvim-treesitter/nvim-treesitter
--  - https://github.com/nihilistkitten/dotfiles/blob/main/nvim/lua/picker.lua
--  - https://sbulav.github.io/vim/neovim-setting-up-luasnip/

-- TO ADD:
-- - https://github.com/hrsh7th/cmp-path
-- - https://github.com/nvim-tree/nvim-web-devicons
-- - https://github.com/folke/trouble.nvim
-- - https://github.com/nvim-treesitter/nvim-treesitter
-- - https://github.com/nvim-tree/nvim-web-devicons
-- - https://github.com/numToStr/Comment.nvim

-- To customize:
-- - https://github.com/nvim-telescope/telescope.nvim

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  --[[
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp says not to use omnifunc with nvim_cmp
  --]]

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Packer bootstrapping
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
-- Packer
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use "nvim-lua/plenary.nvim" -- Neovim library for obsidian.nvim
  use 'epwalsh/obsidian.nvim'
  use 'andweeb/presence.nvim' -- Discord rich presense integration
  --use 'rcarriga/nvim-notify' -- Replace default neovim notifications
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'p00f/clangd_extensions.nvim'
  use 'simrat39/rust-tools.nvim'
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'sourcekit', 'texlab', 'pylsp', 'sumneko_lua', 'bashls', 'html' }
-- The HTML server says you should do
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- but it is covered by default_capabilities(), so I don't
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
-- Enable clangd and rust-analyzer separately since they have plugins which enhance their functionality
require("clangd_extensions").setup {
  server = {
    on_attach = on_attach,
  },
}
require("rust-tools").setup({
  server = {
    on_attach = on_attach,
  },
})

-- luasnip setup
local luasnip = require 'luasnip'

vim.api.nvim_set_keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.api.nvim_set_keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.api.nvim_set_keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
vim.api.nvim_set_keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
luasnip.config.set_config({
  store_selection_keys="<Tab>", --Use 'viw' to enter 'v'isual mode and select the 'i'nner 'w'ord (the current word without spaces before or after), then hit '<Tab>' (or whatever I now have the key set to). this will remove the selection, allowing you to use `snip.env.TM_SELECTED_TEXT` to get in in a snippet (see the markdown link snippet)
})


-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  --[[
  view = {
    entries = "native" --can be "custom", "wildmenu", or "native", but custom and native appear to be the same
  },
  --]]
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-e'] = cmp.mapping.abort(),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

require("luasnip.loaders.from_lua").load({paths = "./snippets"})

-- require("obsidian").setup({
--   dir = "/Users/sam/Library/Mobile Documents/iCloud~md~obsidian/Documents/Rise and Fall of the Roman Republic",
--   completion = {
--     nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
--   }
-- })

-- setting up spellchecking
vim.opt.spelllang="en_us"
-- do NOT set this option. nvim will automatically pick it up correctly, but if you set it manually then you can't add words to your global spellfile
--vim.opt.spellfile="~/.config/nvim/spell/en.utf-8.add"
vim.api.nvim_set_keymap("n", "<Leader>s", ":set spell!<CR>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("i", "<Leader>s", "<C-O>:set spell!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<c-g>u[s1z=`]<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true })
-- nnoremap <silent> <F11> :set spell!<cr>
-- inoremap <silent> <F11> <C-O>:set spell!<cr>
-- nnoremap <C-l> <c-g>u[s1z=`]<c-g>u
-- inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

--[[
-- The setup config table shows all available config options with their default values:
require("presence"):setup({
  -- General options
  auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
  neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
  main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
  client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
  log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
  debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
  enable_line_number  = false,                      -- Displays the current line number instead of the current project
  blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
  buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
  file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
  show_time           = true,                       -- Show the timer

  -- Rich Presence text options
  editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
  file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
  git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
  plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
  reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
  workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
  line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
--]]
require("presence"):setup({
  main_image = "file",
  neovim_image_text = "nvim",
  --file_assets = { lua = { "the sam", "https://en.gravatar.com/userimage/141800648/e121fccade1465222317926274057fa3.jpeg" } }
})

vim.o.mouse=null --nvim 0.8.0 sets mouse=nvi by default, which I don't like.

--[[
-- https://github.com/neovim/nvim-lspconfig/wiki/User-contributed-tips#use-nvim-notify-to-display-lsp-messages
local nvim_notify = require("notify")
vim.o.termguicolors=true
nvim_notify.setup {
  stages = "fade_in_slide_out",
  timeout = 3000,
  background_colour = "#FF8C00",
  render = "simple",
}
vim.notify = nvim_notify
--]]

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  --ensure_installed = { "c", "lua", "rust", "swift" },
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false, --default: true

  -- List of parsers to ignore installing (for "all")
  --ignore_install = { "javascript" },
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    --disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    --[[
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    --]]

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
}
-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
---ENDWORKAROUND
vim.o.foldlevelstart=99
