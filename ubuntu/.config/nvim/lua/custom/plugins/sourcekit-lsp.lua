-- lua/custom/plugins/sourcekit-lsp.lua
return {
  {
    'neovim/nvim-lspconfig',
    ft = { 'swift', 'objective-c', 'objective-cpp' },
    enabled = false,
    config = function()
      -- Only configure if sourcekit-lsp is available
      if vim.fn.executable 'sourcekit-lsp' == 0 then
        vim.notify('sourcekit-lsp not found - skipping Swift LSP setup', vim.log.levels.WARN)
        return
      end

      local lspconfig = require 'lspconfig'

      -- Get capabilities from blink.cmp
      local capabilities = vim.tbl_deep_extend(
        'force',
        vim.lsp.protocol.make_client_capabilities(),
        require('blink.cmp').get_lsp_capabilities() or {},
        -- Add sourcekit-lsp specific capabilities
        {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        }
      )

      -- Configure sourcekit-lsp (works with xcode-build-server automatically)
      lspconfig.sourcekit.setup {
        capabilities = capabilities,
        cmd = { 'sourcekit-lsp' },
        filetypes = { 'swift', 'objective-c', 'objective-cpp' },
        root_dir = lspconfig.util.root_pattern(
          'buildServer.json', -- xcode-build-server creates this
          '.xcodeproj',
          '.xcworkspace',
          'Package.swift',
          '.git'
        ),
        settings = {},
        single_file_support = false,
      }
    end,
  },

  -- Add Swift treesitter support
  {
    'nvim-treesitter/nvim-treesitter',
    ft = { 'swift' },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'swift' },
      }
    end,
  },
}
