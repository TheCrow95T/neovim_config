return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", 'folke/snacks.nvim', },
    config = function()
      require("easy-dotnet").setup({
        lsp = {
          enabled = true, -- Enable builtin roslyn lsp
          roslynator_enabled = false,
          config = {
            settings = {
              ["csharp|projects"] = {
                dotnet_enable_file_based_programs = true,
              },
              ["csharp|background_analysis"] = {
                dotnet_analyzer_diagnostics_scope = "fullSolution",
                dotnet_compiler_diagnostics_scope = "fullSolution",
              },
              ["csharp|inlay_hints"] = {
                csharp_enable_inlay_hints_for_implicit_object_creation = true,
                csharp_enable_inlay_hints_for_implicit_variable_types = true,
                csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                csharp_enable_inlay_hints_for_types = true,
                dotnet_enable_inlay_hints_for_indexer_parameters = true,
                dotnet_enable_inlay_hints_for_literal_parameters = true,
                dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                dotnet_enable_inlay_hints_for_other_parameters = true,
                dotnet_enable_inlay_hints_for_parameters = true,
                dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
              },
              ["csharp|symbol_search"] = {
                dotnet_search_reference_assemblies = true,
              },
              ["csharp|completion"] = {
                dotnet_show_name_completion_suggestions = true,
                dotnet_show_completion_items_from_unimported_namespaces = true,
                dotnet_provide_regex_completions = true,
              },
              ["csharp|code_lens"] = {
                dotnet_enable_references_code_lens = true,
              },
            },
          },
        },
      })
    end
  },
  {
    "pmizio/typescript-tools.nvim",
    event = "VeryLazy",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
    config = function(_, opts)
      local api = require("typescript-tools.api")
      opts.handlers = {
        ["textDocument/publishDiagnostics"] = api.filter_diagnostics({
          80001, -- Ignore this might be converted to a ES export
        }),
      }
      require("typescript-tools").setup(opts)
    end,
    opts = {
      expose_as_code_action = "all",
      complete_function_calls = false,
      jsx_close_tag = {
        enable = true,
        filetypes = { "javascriptreact", "typescriptreact" },
      },
    },
  },
  {
    url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    enabled = false,
    event = "VeryLazy",
    ft = { "javascript", "typescript" },
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("sonarlint").setup({
        server = {
          cmd = {
            "sonarlint-language-server",
            "-stdio",
            "-analyzers",
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
        },
        settings = {
          sonarlint = {
            rules = {
              ["typescript:S6019"] = { level = "on" },
              ["typescript:S6035"] = { level = "on" },
              ["typescript:S2933"] = { level = "on" },
              ["typescript:S1607"] = { level = "on" },
              ["typescript:S6079"] = { level = "on" },
            },
          },
        },
      })
    end,
  },
}
