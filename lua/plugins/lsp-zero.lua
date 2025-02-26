return {
  -- Mason (LSP Installer)
  {
    'williamboman/mason.nvim',
    cmd = {'Mason', 'MasonInstall', 'MasonUpdate'}, -- Load only when needed
    opts = {},
  },

  {
    'williamboman/mason-lspconfig.nvim',
    event = 'BufReadPost', -- Load only when a file is opened
    dependencies = {'williamboman/mason.nvim'},
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = {'InsertEnter', 'LspAttach'}, -- Load only when needed
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        sources = {
          {name = 'nvim_lsp'},
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
          ['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
          ['<CR>'] = cmp.mapping.confirm({select = true}),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })
    end
  },

  -- LSP Configuration
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPost', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    init = function()
      vim.opt.signcolumn = 'yes'
    end,
    config = function()
      vim.defer_fn(function() -- Delay LSP setup slightly to improve UI responsiveness
        local lsp_defaults = require('lspconfig').util.default_config
        lsp_defaults.capabilities = vim.tbl_deep_extend(
          'force',
          lsp_defaults.capabilities,
          require('cmp_nvim_lsp').default_capabilities()
        )

        vim.api.nvim_create_autocmd('LspAttach', {
          once = true, -- Set keymaps only once
          desc = 'LSP keymaps',
          callback = function(event)
            local opts = {buffer = event.buf}
            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
            vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
          end,
        })

        require('mason-lspconfig').setup({
          ensure_installed = {},
          handlers = {
            function(server_name)
              require('lspconfig')[server_name].setup({})
            end,
          }
        })
      end, 100) -- Small delay to prevent UI lag
    end
  }
}
