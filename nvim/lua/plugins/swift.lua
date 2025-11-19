-- ============================================================================
-- Swift.nvim Configuration for LazyVim
-- ============================================================================
--
-- This config integrates swift.nvim with LazyVim's existing setup.
-- LazyVim already includes: nvim-lspconfig, nvim-cmp, LuaSnip, which-key
--
-- ============================================================================

return {
  {
    "devswiftzone/swift.nvim",
    ft = "swift", -- Load only for Swift files
    opts = {
      features = {
        -- LSP (integrates with LazyVim's lspconfig)
        lsp = {
          enabled = true,
          auto_setup = true,
          on_attach = function(client, bufnr)
            -- LazyVim's default LSP keybindings will work automatically
            -- gd, gr, K, etc. are already configured by LazyVim
          end,
        },

        -- Formatter
        formatter = {
          enabled = true,
          auto_format = false, -- Set to true for format on save
          tool = "swift-format", -- or "swiftformat"
        },

        -- Linter (SwiftLint)
        -- linter = {
        --   enabled = true,
        --   auto_lint = true, -- Lint on save
        -- },

        -- Build System
        build_runner = {
          enabled = true,
          show_output = true,
          output_position = "botright",
          output_height = 15,
        },

        -- Target Manager
        target_manager = {
          enabled = true,
          auto_select = true,
        },

        -- Debugger (Direct LLDB - No nvim-dap needed!)
        debugger = {
          enabled = true,
          lldb_path = nil, -- Auto-detect

          signs = {
            breakpoint = "●",
            current_line = "➤",
          },

          colors = {
            breakpoint = "DiagnosticError",
            current_line = "DiagnosticInfo",
          },

          window = {
            position = "bottom", -- "bottom", "right", or "float"
            size = 15,
          },
        },

        -- Snippets (LazyVim already has LuaSnip)
        snippets = {
          enabled = true,
        },

        -- Xcode (macOS only)
        xcode = {
          enabled = vim.fn.has("mac") == 1,
        },
      },

      -- Logging
      log_level = "info", -- "debug" for troubleshooting
    },

    config = function(_, opts)
      require("swift").setup(opts)

      -- ======================================================================
      -- KEYBINDINGS
      -- ======================================================================
      --
      -- Using LazyVim's leader key (default: Space)
      -- Organized to avoid conflicts with LazyVim defaults
      --
      -- ======================================================================

      local debugger = require("swift.features.debugger")

      -- ----------------------------------------------------------------------
      -- DEBUGGER: F keys (Standard across all IDEs)
      -- ----------------------------------------------------------------------

      vim.keymap.set("n", "<F5>", debugger.continue, {
        desc = "Debug: Continue/Run",
        silent = true,
      })

      vim.keymap.set("n", "<F9>", debugger.toggle_breakpoint, {
        desc = "Debug: Toggle Breakpoint",
        silent = true,
      })

      vim.keymap.set("n", "<F10>", debugger.step_over, {
        desc = "Debug: Step Over",
        silent = true,
      })

      vim.keymap.set("n", "<F11>", debugger.step_into, {
        desc = "Debug: Step Into",
        silent = true,
      })

      vim.keymap.set("n", "<F12>", debugger.step_out, {
        desc = "Debug: Step Out",
        silent = true,
      })

      -- ----------------------------------------------------------------------
      -- DEBUGGER: <leader>d prefix (debug commands)
      -- ----------------------------------------------------------------------

      vim.keymap.set("n", "<leader>db", debugger.toggle_breakpoint, {
        desc = "Toggle Breakpoint",
      })

      vim.keymap.set("n", "<leader>dB", debugger.clear_breakpoints, {
        desc = "Clear All Breakpoints",
      })

      vim.keymap.set("n", "<leader>dc", debugger.continue, {
        desc = "Continue",
      })

      vim.keymap.set("n", "<leader>dq", debugger.stop, {
        desc = "Stop/Quit Debug",
      })

      vim.keymap.set("n", "<leader>dr", debugger.run, {
        desc = "Run",
      })

      vim.keymap.set("n", "<leader>dv", debugger.show_variables, {
        desc = "Show Variables",
      })

      vim.keymap.set("n", "<leader>dt", debugger.show_backtrace, {
        desc = "Show Backtrace",
      })

      vim.keymap.set("n", "<leader>du", ":SwiftDebugUI<CR>", {
        desc = "Toggle Debug UI",
      })

      vim.keymap.set("n", "<leader>dO", debugger.step_over, {
        desc = "Step Over",
      })

      vim.keymap.set("n", "<leader>dI", debugger.step_into, {
        desc = "Step Into",
      })

      vim.keymap.set("n", "<leader>do", debugger.step_out, {
        desc = "Step Out",
      })

      -- ----------------------------------------------------------------------
      -- SWIFT: <leader>S prefix (Swift-specific commands)
      -- Note: Using <leader>S (capital) to avoid conflict with LazyVim's
      --       <leader>s (search/telescope)
      -- ----------------------------------------------------------------------

      -- Build
      vim.keymap.set("n", "<leader>Sb", ":SwiftBuild<CR>", {
        desc = "Build",
      })

      vim.keymap.set("n", "<leader>Sr", ":SwiftRun<CR>", {
        desc = "Run",
      })

      vim.keymap.set("n", "<leader>St", ":SwiftTest<CR>", {
        desc = "Test",
      })

      vim.keymap.set("n", "<leader>Sc", ":SwiftClean<CR>", {
        desc = "Clean",
      })

      -- Format (also available via LazyVim's <leader>cf)
      vim.keymap.set("n", "<leader>Sf", ":SwiftFormat<CR>", {
        desc = "Format File",
      })

      vim.keymap.set("v", "<leader>Sf", ":SwiftFormatSelection<CR>", {
        desc = "Format Selection",
      })

      -- Lint
      vim.keymap.set("n", "<leader>Sl", ":SwiftLint<CR>", {
        desc = "Lint",
      })

      vim.keymap.set("n", "<leader>SL", ":SwiftLintFix<CR>", {
        desc = "Lint & Fix",
      })

      -- Targets
      vim.keymap.set("n", "<leader>ST", ":SwiftTarget<CR>", {
        desc = "Select Target",
      })

      vim.keymap.set("n", "<leader>Ss", ":SwiftSnippets<CR>", {
        desc = "Snippets",
      })

      -- Info
      vim.keymap.set("n", "<leader>Si", ":SwiftInfo<CR>", {
        desc = "Info",
      })

      vim.keymap.set("n", "<leader>Sv", ":SwiftVersionInfo<CR>", {
        desc = "Version",
      })

      vim.keymap.set("n", "<leader>Sh", ":checkhealth swift<CR>", {
        desc = "Health Check",
      })

      -- ----------------------------------------------------------------------
      -- XCODE: <leader>x prefix (macOS only)
      -- ----------------------------------------------------------------------

      if vim.fn.has("mac") == 1 then
        vim.keymap.set("n", "<leader>xb", ":SwiftXcodeBuild<CR>", {
          desc = "Xcode Build",
        })

        vim.keymap.set("n", "<leader>xs", ":SwiftXcodeSchemes<CR>", {
          desc = "Xcode Select Scheme",
        })

        vim.keymap.set("n", "<leader>xo", ":SwiftXcodeOpen<CR>", {
          desc = "Xcode Open",
        })
      end

      -- ======================================================================
      -- WHICH-KEY INTEGRATION (LazyVim has which-key by default)
      -- ======================================================================

      local wk_ok, wk = pcall(require, "which-key")
      if wk_ok then
        wk.add({
          { "<leader>d", group = "debug" },
          { "<leader>S", group = "swift" },
          { "<leader>x", group = "xcode" },
        })
      end

      -- ======================================================================
      -- AUTOCOMMANDS (Optional - Uncomment to enable)
      -- ======================================================================

      local augroup = vim.api.nvim_create_augroup("SwiftNvim", { clear = true })

      -- Auto-format on save (uncomment to enable)
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   group = augroup,
      --   pattern = "*.swift",
      --   callback = function()
      --     vim.cmd("SwiftFormat")
      --   end,
      --   desc = "Auto-format Swift files on save",
      -- })

      -- Show notification when Swift file is opened
      vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        pattern = "swift",
        once = true,
        callback = function()
          vim.notify("Swift.nvim loaded | Press <Space>S for Swift commands", vim.log.levels.INFO, {
            title = "swift.nvim",
          })
        end,
      })
    end,
  },

  -- ============================================================================
  -- OPTIONAL: Statusline integration with lualine (LazyVim uses lualine)
  -- ============================================================================

  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      -- Add Swift target to statusline
      table.insert(opts.sections.lualine_x, {
        function()
          local ok, target_manager = pcall(require, "swift.features.target_manager")
          if ok then
            local target = target_manager.get_current_target()
            if target then
              return "🎯 " .. target
            end
          end
          return ""
        end,
        cond = function()
          return vim.bo.filetype == "swift"
        end,
      })
    end,
  },

  -- ============================================================================
  -- OPTIONAL: Add Swift to Treesitter (if not already included)
  -- ============================================================================

  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "swift" })
      end
    end,
  },
}
